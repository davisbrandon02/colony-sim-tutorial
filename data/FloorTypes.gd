class_name FloorTypes
extends Node

# Name
# Texture
# Source Id
# Atlas coordinates
# Navigable

static var list = {
	'grass': FloorType.new(
		"Grass",
		preload("res://asset/grass.png"),
		3,
		Vector2.ZERO,
		true,
		),
	'dirt': FloorType.new(
		"Dirt",
		preload("res://asset/dirt.png"),
		2,
		Vector2.ZERO,
		true,
		),
	}
