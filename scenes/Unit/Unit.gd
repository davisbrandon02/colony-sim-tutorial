class_name Unit
extends Area2D

@onready var main = get_tree().root.get_node("Main")
@onready var gui = main.get_node("CanvasLayer").get_node("GUI")
@onready var grid: Grid = main.get_node("Grid")
@onready var pf: Pathfinder = grid.get_node("Pathfinding")

signal unitSelected(obj)

var data: UnitData = UnitData.new()
var speed = 100

var path: Array = []
var pos: Vector2:
	get:
		return pos
	set(value):
		pos = value

func _ready():
	pos = grid.worldToGrid(position)
	unitSelected.connect(gui.setSelectedObject)

func _process(delta):
	move(delta)

func move(delta):
	if path.size() > 0:
		if position.distance_to(path[0]) < 5:
			pos = grid.worldToGrid(path[0])
			position = path[0]
			path.pop_front()
		else:
			pos = grid.worldToGrid(position)
			position += (path[0] - position).normalized() * data.speed * delta

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		emit_signal("unitSelected", self)

func get_class():
	return "Unit"
