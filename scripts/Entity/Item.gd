class_name Item
extends Object

var type: ItemType
var cell: Cell
var count: int

func _init(_type: ItemType, _cell: Cell, _count: int) -> void:
	type = _type
	cell = _cell
	count = _count

func getType():
	return Item
