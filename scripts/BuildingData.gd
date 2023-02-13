class_name BuildingData
extends Resource

@export var name: String
@export var id: int
@export var coords: Vector2
@export var resourcesRequired: Dictionary
@export var workRequired: int
@export var isRestingSpot: bool = false
@export var isNavigable: bool = false
@export var recipes: Array[RecipeData]

func get_class():
	return 'BuildingData'
