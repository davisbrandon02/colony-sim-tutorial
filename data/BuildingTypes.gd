class_name BuildingTypes
extends Node

# Name
# Texture
# Source Id
# Atlas coordinates
# Navigable

var stone = BuildingType.new(
	"Stone",
	preload("res://asset/stone.png"),
	3,
	Vector2.ZERO,
	false
)

var woodWall = BuildingType.new(
	"Wood Wall",
	preload("res://asset/woodwall.png"),
	5,
	Vector2.ZERO,
	false
)
