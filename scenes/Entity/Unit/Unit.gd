class_name Unit
extends Node2D

var pathfinding: Pathfinding
@export var unitPathfinding: UnitPathfinding

var unitName: String = "Unit"
var moveSpeed: float = 100.0

var pos: Vector2i

func setPath(_pos: Vector2i):
	unitPathfinding.getPathTo(_pos)
