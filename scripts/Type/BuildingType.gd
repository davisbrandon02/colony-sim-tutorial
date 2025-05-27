class_name BuildingType
extends Resource

@export var name: String
@export var texture: Texture = load("res://asset/missing.png")
@export var sourceId: int
@export var atlasCoords: Vector2 = Vector2(0,0)
@export var navigable: bool = false

func getType():
	return BuildingType

static var types: Dictionary[String,BuildingType] = {
	"rock_wall": load("res://data/BuildingType/rock_wall.tres"),
	"wood_wall": load("res://data/BuildingType/wood_wall.tres")
}
