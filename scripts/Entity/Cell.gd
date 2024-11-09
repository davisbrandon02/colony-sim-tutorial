class_name Cell
extends Node

var grid: Grid

var pos: Vector2

var floor: Floor
var building: Building
var item: Item
var plant: Plant

func isNavigable():
	if !building and !plant:
		return true
	if building:
		return building.buildingType.navigable
	if plant:
		return plant.plantType.navigable
	else:
		return false

func isOccupied():
	if !building and !item and !plant:
		return false
	else:
		return true
