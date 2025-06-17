class_name Grid
extends Node2D

@export var pf: Pathfinding

var grid: Dictionary = {}
@export var floorLayer: TileMapLayer
@export var buildingLayer: TileMapLayer
@export var plantLayer: TileMapLayer
@export var itemLayer: TileMapLayer
@export var blueprintLayer: TileMapLayer
@export var itemAmountLayer: Control

signal tile_selected(pos: Vector2i)
signal tile_move_clicked(pos: Vector2i)

func initializeGrid() -> void:
	# Get all used tiles
	var usedCells = floorLayer.get_used_cells() + buildingLayer.get_used_cells() + itemLayer.get_used_cells()
	for tile in usedCells:
		var cell = Cell.new()
		cell.update.connect(grid.updateCell)
		grid[tile] = cell
		cell.grid = self
		
		# Match the floor data
		var floorId = floorLayer.get_cell_source_id(tile)
		for floorType:FloorType in FloorType.types.values():
			if floorType.sourceId == floorId:
				cell.floor = Floor.new(floorType, cell)
		
		# Match the building data
		var buildingId = buildingLayer.get_cell_source_id(tile)
		for buildingType:BuildingType in BuildingType.types.values():
			if buildingType.sourceId == buildingId:
				cell.building = Building.new(buildingType, cell, true)
		
		# Match the plant data
		var plantId = plantLayer.get_cell_source_id(tile)
		for plantType:PlantType in PlantType.types.values():
			if plantType.sourceId == plantId:
				cell.plant = Plant.new(plantType, cell, true)
		
		# Match the item data (if any)
		var itemId = itemLayer.get_cell_source_id(tile)
		for itemType:ItemType in ItemType.types.values():
			if itemType.sourceId == itemId:
				cell.item = Item.new(itemType, cell, 1)
		
		updateCell(cell)

func updateCell(cell: Cell):
	# If cell isn't in grid, do nothing
	if cell.pos not in grid.keys():
		return
	
	# Set floor
	if cell.floor != null:
		floorLayer.set_cell(cell.pos, cell.floor.type.sourceId, cell.floor.type.atlasCoords)
	else:
		floorLayer.set_cell(cell.pos, FloorType.types.dirt.sourceId, FloorType.types.dirt.atlasCoords)
	
	# Set building
	if cell.building != null:
		if cell.building.built == true:
			buildingLayer.set_cell(cell.pos, cell.building.type.sourceId, cell.building.type.atlasCoords)
		else:
			blueprintLayer.set_cell(cell.pos, cell.building.type.sourceId, cell.building.type.atlasCoords)
	else:
		buildingLayer.set_cell(cell.pos)
		
	# Set plant
	if cell.plant != null:
		plantLayer.set_cell(cell.pos, cell.plant.type.sourceId, cell.plant.type.atlasCoords)
	else:
		plantLayer.set_cell(cell.pos)
		
	# Set item
	if cell.item != null:
		itemLayer.set_cell(cell.pos, cell.item.type.sourceId, cell.item.type.atlasCoords)
	else:
		itemLayer.set_cell(cell.pos)

func getNearestUnoccupiedCell(_pos: Vector2i, radius: int):
	if grid[_pos].isOccupied == false: return grid[_pos]
	for tile:Vector2i in floorLayer.get_used_cells():
		if _pos.distance_to(tile) < radius:
			var cell: Cell = grid[tile]
			if cell.isOccupied() == false:
				return cell
	return null

# Input - get clicked tile
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		emit_signal("tile_selected", floorLayer.local_to_map(get_global_mouse_position()))
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
		emit_signal("tile_move_clicked", floorLayer.local_to_map(get_global_mouse_position()))
