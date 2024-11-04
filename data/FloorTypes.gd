class_name FloorTypes
extends Node

# Name
# Texture
# Source Id
# Atlas coordinates
# Navigable

static var list = [
	FloorType.new(
		"Grass",
		preload("res://asset/grass.png"),
		0,
		Vector2.ZERO,
		true,
	),
	FloorType.new(
		"Dirt",
		preload("res://asset/dirt.png"),
		1,
		Vector2.ZERO,
		true,
	)
]
