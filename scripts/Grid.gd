class_name Grid
extends TileMap

@export var width: int = 12
@export var height: int = 12
@export var cell_size: int = 128

var grid: Dictionary = {}

@onready var pf: Pathfinder = get_node('Pathfinding')

signal tileSelected(pos)

@export var show_debug: bool = false
func generateGrid() -> void:
	for x in width:
		for y in height:
			var _pos = Vector2(x,y)
			
			# Create the grid
			grid[_pos] = CellData.new(Vector2(x,y))
			
			# Set all to grass for now
			grid[_pos].floorData = preload("res://data/floor/grass.tres")
			
			# Connect signals
			grid[_pos].navChanged.connect(updateNav)
			
			refreshTile(Vector2(x,y))
			
			# debug grid
			if show_debug:
				var rect = ReferenceRect.new()
				rect.position = gridToWorld(Vector2(x,y))
				rect.size = Vector2(cell_size, cell_size)
				rect.editor_only = false
				$Debug.add_child(rect)
				var label = Label.new()
				label.position = gridToWorld(Vector2(x,y))
				label.text = str(Vector2(x,y))
				$Debug.add_child(label)

func gridToWorld(_pos: Vector2) -> Vector2:
	return _pos * cell_size

func worldToGrid(_pos: Vector2) -> Vector2:
	return floor(_pos / cell_size)

func refreshTile(_pos: Vector2) -> void:
	var data = grid[_pos]
	set_cell(0, _pos, data.floorData.id, data.floorData.coords)
	if data.occupier:
		set_cell(1, _pos, data.occupier.id, data.occupier.coords)

func setTile(_pos: Vector2, _data) -> void:
	match _data.get_class():
		'FloorData':
			grid[_pos].floorData = _data
		'BuildingData':
			grid[_pos].occupier = _data
			if _data.isNavigable == false:
				grid[_pos].navigable = false
				pf.disconnectPoint(_pos)
	refreshTile(_pos)

func updateNav(_pos) -> void:
	if grid[_pos].navigable == false:
		pf.disconnectPoint(_pos)
	else:
		pf.connectPoint(_pos)

# Input - get clicked tile
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		emit_signal("tileSelected", worldToGrid(get_global_mouse_position()))
