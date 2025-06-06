class_name ZoneHelper
extends Node2D

@export var grid: Grid

var currentZone: Zone
var dragFrom: Vector2i
var isDragging: bool

signal dragCompleted(cells)

func startDrag():
	set_process(true)
	isDragging = true
	dragFrom = grid.floorLayer.local_to_map(get_global_mouse_position())

func _process(delta: float) -> void:
	# TODO Update cells during drag to show zone area blueprint
	if isDragging:
		pass

func stopDrag():
	var dragTo = grid.floorLayer.local_to_map(get_global_mouse_position())
	
	var cells: Array[Cell]
	
	for x in dragTo.x - dragFrom.x:
		for y in dragTo.y - dragFrom.y:
			cells.append(grid.grid[Vector2i(x, y)])
	
	set_process(false)
	dragCompleted.emit(cells)
