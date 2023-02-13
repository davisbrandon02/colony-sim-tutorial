class_name CellData
extends Object

var pos: Vector2

var floorData: FloorData

var occupier: BuildingData = null

var navigable: bool = true :
	set(value):
		navigable = value
		emit_signal("navChanged", pos)

signal navChanged(_pos: Vector2)

func _init(_pos: Vector2):
	pos = _pos
