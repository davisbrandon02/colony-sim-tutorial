class_name Floor
extends Object

var floorType: FloorType
var cell: Cell

func _init(_floorType: FloorType, _cell: Cell) -> void:
	floorType = _floorType
	cell = _cell

func getType():
	return Floor
