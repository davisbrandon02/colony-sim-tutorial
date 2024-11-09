class_name ItemTypes
extends Node

# Name
# Texture
# Source Id
# Atlas coordinates
# Max stack size

static var list = {
	"stone": ItemType.new(
		"Stone",
		preload("res://asset/stoneitem.png"),
		0,
		Vector2.ZERO,
		99,
	),
	"wood": ItemType.new(
		"Wood",
		preload("res://asset/wood.png"),
		1,
		Vector2.ZERO,
		99,
	),
}
