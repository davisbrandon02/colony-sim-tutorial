class_name Plant
extends Object

var plantType: PlantType
var pos: Vector2

func _init(_plantType: PlantType, _pos: Vector2) -> void:
	plantType = _plantType
	pos = _pos
