class_name Task
extends Object

var targetCell: Cell
var workRadius: int

var workRemaining: float
var onWorkCompleted: Callable

signal completed

func onTaskCompleted():
	pass

func workOnTask(_amount: float):
	workRemaining -= _amount
	if workRemaining <= 0:
		onTaskCompleted()

class HarvestTask extends Task:
	var plant: Plant
