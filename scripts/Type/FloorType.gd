class_name FloorType
extends Resource

@export var name: String
@export var texture: Texture = load("res://asset/missing.png")
@export var sourceId: int
@export var atlasCoords: Vector2 = Vector2(0,0)
@export var navigable: bool = true

static var types: Dictionary[String,FloorType] = {
	"dirt": load("res://data/FloorType/dirt.tres"),
	"grass": load("res://data/FloorType/grass.tres"),
}
