class_name Pathfinding
extends Node2D

@export var show_debug: bool

@export var main: Main
@export var grid: Grid

var aStar = AStar2D.new()

var idMap: Dictionary = {}
const NEIGHBOR_DIRECTIONS = [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]

func initialize():
	# Add all points
	var idCount: int = 0
	for tile in grid.grid:
		var cell: Cell = grid.grid[tile]
		aStar.add_point(idCount, tile)
		idMap[tile] = idCount
		idCount += 1
	
	# Connect all points with neighbors IF they are navigable
	for tile in grid.grid:
		var cell: Cell = grid.grid[tile]
		if cell.isNavigable():
			connectPoint(tile)

func addPoint(pos: Vector2i, addAndConnect: bool = false):
	var id
	if pos in idMap.keys():
		id = idMap[pos]
	else:
		id = idMap.values()[-1]
	var newId = id + 1
	aStar.add_point(newId, pos)
	if addAndConnect:
		connectPoint(pos)
	queue_redraw()

func connectPoint(pos: Vector2i):
	var cell: Cell = grid.grid[Vector2i(pos.x, pos.y)]
	var pointId = idMap[pos]
	for direction in NEIGHBOR_DIRECTIONS:
		var neighborPos: Vector2i = pos + direction
		if grid.grid.has(neighborPos):
			var neighborCell: Cell = grid.grid[neighborPos]
			var neighborID = idMap[neighborPos]
			if neighborCell.isNavigable():
				aStar.connect_points(pointId, neighborID)
	queue_redraw()

func disconnectPoint(pos: Vector2i):
	var pointId = idMap[pos]
	for direction in NEIGHBOR_DIRECTIONS:
		var neighborPos: Vector2i = pos + direction
		if grid.grid.has(neighborPos):
			var neighborID = idMap[neighborPos]
			aStar.disconnect_points(pointId, neighborID)
	queue_redraw()

func _draw():
	if show_debug:
		for tile in idMap:
			var tileId = idMap[tile]
			var cell: Cell = grid.grid[tile]
			if cell.isNavigable():
				draw_circle(grid.map_to_local(tile), 5, Color.DARK_GREEN)
			else:
				draw_circle(grid.map_to_local(tile), 5, Color.RED)
			for dir in NEIGHBOR_DIRECTIONS:
				var neighborPos: Vector2i = tile + dir
				if grid.grid.has(neighborPos):
					var neighborCell: Cell = grid.grid[neighborPos]
					var neighborID = idMap[neighborPos]
					if neighborCell.isNavigable():
						if aStar.are_points_connected(tileId, neighborID):
							draw_line(grid.map_to_local(tile), grid.map_to_local(neighborPos), Color.GREEN)
						else:
							draw_line(grid.map_to_local(tile), grid.map_to_local(neighborPos), Color.RED)
