class_name Cell
extends Node

var pos: Vector2

var floor: Floor
var building: Building
var item: Item
var plant: Plant

func isOccupied():
	if !building and !item and !plant:
		return false
	else:
		return true
