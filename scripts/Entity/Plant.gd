class_name Plant
extends Object

var type: PlantType
var cell: Cell
var mature: bool

func _init(_type: PlantType, _cell: Cell, _mature: bool) -> void:
	type = _type
	cell = _cell
	mature = _mature

func getType():
	return Plant
