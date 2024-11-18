class_name Task
extends Object

enum TYPE {
	harvest,
}
var type: TYPE

var targetPos: Vector2i
var targetCell: Cell
var workRadius: int

var workRemaining: float
var onWorkCompleted: Callable

func onTaskCompleted():
	pass

func workOnTask(_amount: float):
	workRemaining -= _amount
	if workRemaining <= 0:
		onTaskCompleted()
