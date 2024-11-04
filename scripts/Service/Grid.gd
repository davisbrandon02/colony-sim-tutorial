class_name Grid
extends TileMap

@export var cell_size: int = 128

var grid: Dictionary = {}

@export var pf: Pathfinding

signal tileSelected(pos)

func initializeGrid() -> void:
	# Get all used tiles
	# Match the tile data with buildingtype/floortype/planttype information and set cell info
	pass

# Input - get clicked tile
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		emit_signal("tileSelected", local_to_map(get_global_mouse_position()))
