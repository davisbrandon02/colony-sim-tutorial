class_name ZoneHelper
extends Node2D

var currentZone: Zone
var dragFrom: Vector2i
var isDragging: bool
var tilesInDrag: Array[Cell]

func startDrag():
	isDragging = true

func stopDrag():
	pass

func _draw():
	pass
