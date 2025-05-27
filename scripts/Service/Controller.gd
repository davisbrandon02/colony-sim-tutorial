class_name Controller
extends Node2D

@export var grid: Grid
@export var pathfinding: Pathfinding
@export var zoneHelper: ZoneHelper
@export var units: Node2D

signal set_tile(pos, object)
signal object_selected(object: Object)

var selectedUnits: Array[Unit]

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

func unitSelected(unit: Unit):
	if state == STATE.select:
		selectedUnits.append(unit)
		unit.get_node("SelectedRect").visible = true

func unitDeselected(unit: Unit):
	selectedUnits.erase(unit)
	unit.get_node("SelectedRect").visible = false

func orderMoveTo(_pos: Vector2i):
	for u:Unit in selectedUnits:
		u.setPath(_pos)

# Input - key press
func _input(event):
	if event.is_action("escape"):
		if state == STATE.select:
			for u:Unit in selectedUnits:
				unitDeselected(u)
		elif state == STATE.placing:
			state = STATE.select
	elif event.is_action("left_click") and event.is_pressed():
		if state == STATE.zoning:
			zoneHelper.startDrag()
	elif event.is_action("left_click") and event.is_released():
		if state == STATE.zoning:
			zoneHelper.stopDrag()

enum STATE {
	select,
	placing,
	zoning,
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
