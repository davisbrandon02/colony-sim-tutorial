class_name Main
extends Node2D

@export var grid: Grid
@export var pf: Pathfinding

func _ready():
	grid.generateGrid()
	pf.initialize()
