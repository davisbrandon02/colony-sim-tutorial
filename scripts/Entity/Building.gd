class_name Building
extends Object

var buildingType: BuildingType
var pos: Vector2

func _init(_buildingType: BuildingType, pos: Vector2) -> void:
	buildingType = _buildingType
