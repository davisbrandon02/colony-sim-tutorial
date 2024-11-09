class_name Building
extends Object

var buildingType: BuildingType
var pos: Vector2
var built: bool

func _init(_buildingType: BuildingType, _pos: Vector2, _built: bool) -> void:
	buildingType = _buildingType
	pos = _pos
	built = _built

func getType():
	return Building
