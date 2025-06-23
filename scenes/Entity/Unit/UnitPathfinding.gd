class_name UnitPathfinding
extends Node2D

@export var unit: Unit
var pf: Pathfinding
var grid: Grid

var path = []

var POSITION_TOLERANCE = 2

const TILE_SIZE = 128

func _process(delta: float) -> void:
	if path.size() > 0:
		var dir = unit.position.direction_to(path[0])
		unit.position += dir * unit.moveSpeed * delta
		if unit.position.distance_to(Vector2(path[0])) < POSITION_TOLERANCE:
			unit.position = path[0]
			unit.pos = path[0] / TILE_SIZE
			path.remove_at(0)

func getPathTo(_pos: Vector2i):
	unit.position = unit.pos * TILE_SIZE
	path = pf.getPath(unit.pos, _pos)

func goToTask(task: Task):
	var workableTiles: Array[Vector2i]
