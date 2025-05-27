class_name ItemType
extends Resource

@export var name: String
@export var texture: Texture = load("res://asset/missing.png")
@export var sourceId: int = 0
@export var atlasCoords: Vector2 = Vector2(0,0)
@export var maxStack: int = 50

static var types: Dictionary[String, ItemType] = {
	"stone": load("res://data/ItemType/stone.tres"),
	"wood": load("res://data/ItemType/wood.tres"),
}
