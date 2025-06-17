class_name Cell
extends Node

var grid: Grid

var pos: Vector2

var floor: Floor
var building: Building
var item: Item
var plant: Plant
var stockpile: Stockpile

signal update(cell: Cell)

func setStockpile(s: Stockpile):
	stockpile = s
	update.emit(self)

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
