class_name Unit
extends Node2D

@export var unitPathfinding: UnitPathfinding
@export var unitTaskManager: UnitTaskManager

var unitName: String = "Unit"
var moveSpeed: float = 200.0

var pos: Vector2i

enum STATE {
	idle,
	moving,
	working,
}
var state: STATE = STATE.idle
func setState(_state: STATE):
	state = _state

func setPath(_pos: Vector2i):
	unitPathfinding.getPathTo(_pos)
	setState(STATE.moving)

func assignTask(task: Task):
	pass
