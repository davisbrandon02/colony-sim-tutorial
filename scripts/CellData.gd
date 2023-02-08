class_name CellData
extends Object

signal cellChanged(_pos: Vector2)
signal navChanged(_pos: Vector2)

var pos: Vector2

var floorData: FloorData :
	set(value):
		floorData = value
		emit_signal("cellChanged", pos)
	get:
		return floorData

var occupier = null :
	set(value):
		occupier = value
		emit_signal("cellChanged", pos)
	get:
		return occupier

var navigable: bool = true :
	set(value):
		navigable = value
		emit_signal("navChanged", pos)
	get:
		return navigable

func _init(_pos: Vector2):
	pos = _pos

