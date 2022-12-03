extends Node2D

@onready var grid: Grid = $Grid

func _ready():
	grid.generateGrid()
	$Grid/Pathfinding.initialize()
