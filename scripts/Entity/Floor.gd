class_name Floor
extends Object

var floorType: FloorType
var pos: Vector2

func _init(_floorType: FloorType, _pos: Vector2) -> void:
	floorType = _floorType
	pos = _pos

func getType():
	return Floor
