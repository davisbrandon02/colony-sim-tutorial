class_name InfoPanel
extends Control

var selectedObject: Object
@export var nameLabel: Label

func setSelectedObject(object: Object):
	if object.getType() in [Plant, Item, Building]:
		visible = true
		match object.getType():
			Plant:
				nameLabel.text = object.plantType.name
			Item:
				nameLabel.text = object.itemType.name
			Building:
				nameLabel.text = object.buildingType.name

func _input(event: InputEvent) -> void:
	if event.is_action("escape") and event.is_pressed:
		visible = false
