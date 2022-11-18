class_name BuildingData
extends Resource

@export var name: String
@export var texture: Texture
@export var unbuiltTexture: Texture
@export var width: int = 1
@export var height: int = 1
@export var resourcesRequired: Dictionary
@export var workRequired: int
@export var isRestingSpot: bool
@export var recipes: Array[RecipeData]

