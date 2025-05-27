class_name Building
extends Object

var buildingType: BuildingType
var cell: Cell
var rotation: float
var built: bool

func _init(_buildingType: BuildingType, _cell: Cell, _built: bool) -> void:
	buildingType = _buildingType
	cell = _cell
	built = _built

func getType():
	return Building
