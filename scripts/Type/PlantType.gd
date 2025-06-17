class_name PlantType
extends Resource

@export var name: String
@export var texture: Texture
@export var growingTexture: Texture
@export var sourceId: int
@export var atlasCoords: Vector2 = Vector2(0,0)
@export var navigableWhileGrowing: bool = true
@export var navigableWhileMature: bool = false
@export var maxGrowth: float
@export var growthPerDay: float
@export var drops: Dictionary[ItemType, int]

func getType():
	return PlantType

static var types: Dictionary[String,PlantType] = {
	"tree": load("res://data/PlantType/tree.tres"),
}
