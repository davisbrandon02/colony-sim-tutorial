class_name Item
extends Object

var itemType: ItemType
var count: int
var pos: Vector2

func _init(_itemType: ItemType, _count: int) -> void:
	itemType = _itemType
	count = _count
