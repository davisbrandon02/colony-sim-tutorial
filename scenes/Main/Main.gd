class_name Main
extends Node2D

@export var grid: Grid
@export var pf: Pathfinding
@export var controller: Controller
@export var infoPanel: InfoPanel
@export var units: Node2D
@export var guiBtns: GUIButtons

func _ready():
#	Connect grid input to controller
	grid.tile_selected.connect(controller.tileSelected)
	grid.tile_move_clicked.connect(controller.orderMoveTo)
	
#	Initialize the game grid
	grid.initializeGrid()
	
#	Initialize the pathfinding system
	pf.initialize()
	
	# Initialize GUI
	guiBtns.initialize()
	
#	Connect controller to UI
	controller.object_selected.connect(infoPanel.setSelectedObject)
	guiBtns.startPlacing.connect(controller.setPlacing)
	guiBtns.startZoning.connect(controller.setStockpileZone)
	guiBtns.cancel.connect(controller.cancelAction)
	
	# Place colonists
	var unit1 = preload("res://scenes/Entity/Unit/unit.tscn").instantiate()
	unit1.pos = Vector2(4,4)
	unit1.position = Vector2(4,4) * 128
	units.add_child(unit1)
	unit1.get_node("Services/UnitPathfinding").pf = pf
	unit1.get_node("Services/UnitPathfinding").grid = grid
	unit1.setPath(Vector2i(12,7))
	
	# Connect unit signals
	for u:Unit in units.get_children():
		u.selected.connect(controller.unitSelected)
