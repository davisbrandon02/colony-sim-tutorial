class_name Unit
extends Area2D

@onready var main = get_tree().root.get_node("Main")
@onready var grid: Grid = main.get_node("Grid")
@onready var pf: Pathfinder = grid.get_node("Pathfinding")

var data: UnitData
var speed = 100

var path: Array = []
var pos: Vector2:
	get:
		return pos
	set(value):
		pos = value

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
			position += (path[0] - position).normalized() * speed * delta

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var clicked = grid.worldToGrid(get_global_mouse_position())
			path = pf.getPath(pos, clicked)
