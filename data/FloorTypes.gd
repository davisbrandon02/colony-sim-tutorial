class_name FloorTypes
extends Node

# Name
# Texture
# Source Id
# Atlas coordinates

var grass = FloorType.new(
	"Grass",
	preload("res://asset/grass.png"),
	1,
	Vector2.ZERO
)

var dirt = FloorType.new(
	"Dirt",
	preload("res://asset/dirt.png"),
	2,
	Vector2.ZERO
)
