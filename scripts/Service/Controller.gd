class_name Controller
extends Node2D

@export var grid: Grid
@export var pathfinding: Pathfinding

signal set_tile(pos, object)
signal object_selected(object: Object)

# Input - tile selected
func tileSelected(_pos: Vector2i):
	if state == STATE.placing:
		if grid.grid.has(_pos) and placing != null:
			if placing.getType() == BuildingType:
				pass
	elif state == STATE.select:
		if grid.grid.has(_pos):
			var cell: Cell = grid.grid[_pos]
			if cell.item:
				emit_signal("object_selected", cell.item)
			elif cell.building:
				emit_signal("object_selected", cell.building)
			elif cell.plant:
				emit_signal("object_selected", cell.plant)
		pathfinding.disconnectPoint(_pos)

# Input - key press
func _input(event):
	if event.is_action("escape") and state != STATE.select:
		state = STATE.select

enum STATE {
	select,
	placing
}
var state = STATE.select
func setState(_state: STATE):
	state = _state

# Placing
var placing: Object = null
func setPlacing(_data):
	if _data.type in [FloorType, BuildingType, PlantType]:
		state = STATE.placing
		placing = _data
