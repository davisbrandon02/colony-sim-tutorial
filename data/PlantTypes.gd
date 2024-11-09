class_name PlantTypes
extends Node

# Name
# Texture
# Source Id
# Atlas coordinates
# Navigable
# Max growth
# Growth per day
# Drops[]

static var list = {
	"tree": PlantType.new(
		"Tree",
		preload("res://asset/tree.png"),
		2,
		Vector2.ZERO,
		5,
		1,
		[
			Item.new(ItemTypes.list["wood"], 8),
			]
	),
}
