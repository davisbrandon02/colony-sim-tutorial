class_name Floor
extends Object

var type: FloorType
var cell: Cell

func _init(_type: FloorType, _cell: Cell) -> void:
	type = _type
	cell = _cell

func getType():
	return Floor
