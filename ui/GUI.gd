class_name GUI
extends Control

var selectedObject = null : 
	get:
		return selectedObject
	set(value):
		selectedObject = value
		if value != null:
			$InfoPanel.visible = true
			match value.get_class():
				"Unit":
					$InfoPanel/Name.text = value.data.name
					$BaseButtons/HBoxContainer/Bio.visible = true
		else:
			$InfoPanel.visible = false
			$BaseButtons/HBoxContainer/Bio.visible = false

signal setPlacingObject(_data)

func setSelectedObject(obj):
	selectedObject = obj

func _on_construct_pressed():
	$BaseButtons.visible = false
	$ConstructButtons.visible = true

func _on_back_pressed():
	$BaseButtons.visible = true
	$ConstructButtons.visible = false

func _on_gui_input(event):
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		selectedObject = null

# --- Construct --- #

func _on_wood_wall_pressed():
	emit_signal("setPlacingObject", load("res://data/building/WoodWall.tres"))

func _on_stone_wall_pressed():
	emit_signal("setPlacingObject", load("res://data/building/StoneWall.tres"))

func _on_dirt_floor_pressed():
	emit_signal("setPlacingObject", load("res://data/floor/dirt.tres"))
