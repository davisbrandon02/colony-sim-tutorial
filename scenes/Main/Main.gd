extends Node2D

@onready var grid: Grid = $Grid
@onready var gui: Control = $CanvasLayer/GUI

func _ready():
	grid.generateGrid()
	$Grid/Pathfinding.initialize()
	
	# Connect child signals
	grid.tileSelected.connect(tileSelected)
	gui.setPlacingObject.connect(setPlacing)


# --- Game state related ---#

enum STATE {
	select,
	placing
}

var state = STATE.select :
	get:
		return state
	set(value):
		state = value

# Placing
var placing = null

func setPlacing(_data):
	state = STATE.placing
	placing = _data

# Input - tile selected
func tileSelected(_pos):
	if state == STATE.placing:
		if grid.grid.has(_pos) and placing != null:
			grid.setTile(_pos, placing)

# Input - key press
func _input(event):
	if event.is_action("escape") and state != STATE.select:
		state = STATE.select
		print(state)
