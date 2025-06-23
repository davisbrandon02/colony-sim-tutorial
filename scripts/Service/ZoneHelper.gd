class_name ZoneHelper
extends Node2D

@export var grid: Grid

var currentZone: Zone
var dragFrom: Vector2i
var cells: Array[Cell]
var isDragging: bool
var parent

signal dragCompleted(cells)

enum MODE {
	STOCKPILE,
	GROW,
}
var mode: MODE = MODE.STOCKPILE

func startDrag(m: MODE, currentZone = null):
	mode = m
	set_process(true)
	
	currentZone = Zone.new()
	parent = null
	
	match m:
		MODE.STOCKPILE:
			var stockpile = Stockpile.new()
			stockpile.placed = false
			stockpile.zone = currentZone
			parent = stockpile
		MODE.GROW:
			pass
	
	isDragging = true
	dragFrom = grid.floorLayer.local_to_map(get_global_mouse_position())

func _process(delta: float) -> void:
	if isDragging:
		var dragTo = grid.floorLayer.local_to_map(get_global_mouse_position())
		
		
		# TODO figure this out
		for x in dragTo.x - dragFrom.x:
			for y in dragTo.y - dragFrom.y:
				var cell: Cell = grid.grid[Vector2i(dragFrom.x + x, dragFrom.y + y)]
				if cell not in cells:
					print("Adding cell %s, %s to zone"  % [cell.pos.x, cell.pos.y])
					cell.setStockpile(parent)
					currentZone.addCells([cell])
	# TODO Update cells during drag to show zone area blueprint
	# TODO show blueprints on zones while dragging

func stopDrag():
	set_process(false)
	parent.placed = true
	isDragging = false
	dragCompleted.emit(cells)
