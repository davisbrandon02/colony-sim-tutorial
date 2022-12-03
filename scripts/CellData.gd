class_name CellData
extends Object

signal cellChanged(_pos)
signal navChanged(_pos)

var pos: Vector2
var occupier = null
var floorData: FloorData
var navigable: bool = true:
	set(value):
		navigable = value
		emit_signal("navChanged", pos)
	get:
		return navigable

func _init(_pos: Vector2):
	pos = _pos

func place():
	emit_signal("cellChanged", pos)
