class_name BuildingTypes
extends Node

# Name
# Texture
# Source Id
# Atlas coordinates
# Navigable

static var list: Dictionary = {
	"stone": BuildingType.new(
		"Stone",
		preload("res://asset/stone.png"),
		3,
		Vector2.ZERO,
		false
	),
	"woodWall": BuildingType.new(
	"Wood Wall",
	preload("res://asset/woodwall.png"),
	5,
	Vector2.ZERO,
	false
	),
}
