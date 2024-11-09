class_name Main
extends Node2D

@export var grid: Grid
@export var pf: Pathfinding
@export var controller: Controller
@export var infoPanel: InfoPanel

func _ready():
#	Connect grid input to controller
	grid.tile_selected.connect(controller.tileSelected)
	
#	Connect controller to UI
	controller.object_selected.connect(infoPanel.setSelectedObject)
	
#	Initialize the game grid
	grid.initializeGrid()
	
#	Initialize the pathfinding system
	pf.initialize()
