class_name TaskTypes
extends Node

@export var grid: Grid

static func getHarvestTask(plant: Plant):
	var task: Task = Task.new()
	task.type = task.TYPE.harvest
	task.targetPos = plant.pos
	task.workRadius = 1
