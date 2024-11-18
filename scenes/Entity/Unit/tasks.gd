class_name UnitTaskManager
extends Node2D

@export var unit: Unit

var tasks: Array[Task]
var activeTask: Task

func addTask(task: Task, setAsActive: bool = false):
	tasks.append(task)
	if setAsActive:
		setActiveTask(task)

func setActiveTask(task: Task):
	activeTask = task
