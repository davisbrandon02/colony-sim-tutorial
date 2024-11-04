class_name Unit
extends Area2D

@onready var main = get_tree().root.get_node("Main")
@onready var gui = main.get_node("CanvasLayer").get_node("GUI")
@onready var grid: Grid = main.get_node("Grid")
@onready var pf: Pathfinder = grid.get_node("Pathfinding")

signal unitSelected(obj)

var speed = 100

var path: Array = []
var pos: Vector2

func _ready():
	pos = grid.worldToGrid(position)
	pos = TileMap.
	unitSelected.connect(gui.setSelectedObject)

func _process(delta):
	move(delta)

func setPos(_pos: Vector2):
	pos = _pos

func move(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		emit_signal("unitSelected", self)
