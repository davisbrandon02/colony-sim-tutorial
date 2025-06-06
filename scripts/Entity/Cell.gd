class_name Cell
extends Node

var grid: Grid

var pos: Vector2

var floor: Floor
var building: Building
var item: Item
var plant: Plant
var zone: Zone

func isNavigable():
	if !building and !plant:
		return true
	if building:
		return building.type.navigable
	if plant:
		if plant.mature:
			return plant.type.navigableWhileMature
		else:
			return plant.type.navigableWhileGrowing
	else:
		return false

func isOccupied():
	if !building and !item and !plant:
		return false
	else:
		return true
