class_name Building
extends Object

var type: BuildingType
var cell: Cell
var rotation: float
var built: bool

func _init(_type: BuildingType, _cell: Cell, _built: bool) -> void:
	type = _type
	cell = _cell
	built = _built

func getType():
	return Building
