class_name Item
extends Object

var itemType: ItemType
var cell: Cell
var count: int

func _init(_itemType: ItemType, _cell: Cell, _count: int) -> void:
	itemType = _itemType
	cell = _cell
	count = _count

func getType():
	return Item
