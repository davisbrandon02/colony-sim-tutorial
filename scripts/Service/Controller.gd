class_name Controller
extends Node2D

@export var grid: Grid

func _ready():
	# Connect child signals
	grid.tileSelected.connect(tileSelected)

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

enum STATE {
	select,
	placing
}

var state = STATE.select

func setState(_state: STATE):
	state = _state
#endregion

# Placing
var placing = null

func setPlacing(_data):
	state = STATE.placing
	placing = _data
