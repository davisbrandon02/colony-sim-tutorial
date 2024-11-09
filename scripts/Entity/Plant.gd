class_name Plant
extends Object

var plantType: PlantType
var pos: Vector2
var mature: bool

func _init(_plantType: PlantType, _pos: Vector2, _mature: bool) -> void:
	plantType = _plantType
	pos = _pos
	mature = _mature

func getType():
	return Plant
