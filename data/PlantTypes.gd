class_name PlantTypes
extends Node

# Name
# Texture
# Source Id
# Atlas coordinates
# Max growth
# Growth per day
# Drops[]
# Navigable


static var list = {
	"tree": PlantType.new(
		"Tree",
		preload("res://asset/tree.png"),
		2,
		Vector2.ZERO,
		false,
		5,
		1,
		[
			Item.new(ItemTypes.list["wood"], 8),
		],
	),
}
