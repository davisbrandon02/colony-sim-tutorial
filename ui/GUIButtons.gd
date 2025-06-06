class_name GUIButtons
extends Control

signal startPlacing(data)
signal startZoning
signal cancel

func initialize():
	# Load all buildable objects
	pass

func _on_construct_pressed():
	%BaseButtons.visible = false
	%ConstructButtons.visible = true
	%StockpileButtons.visible = false

func _on_stockpile_pressed() -> void:
	%BaseButtons.visible = false
	%ConstructButtons.visible = false
	%StockpileButtons.visible = true

func _on_back_pressed() -> void:
	%BaseButtons.visible = true
	%ConstructButtons.visible = false
	%StockpileButtons.visible = false

func _on_cancel_pressed() -> void:
	cancel.emit()
	%BaseButtons.visible = true
	%ConstructButtons.visible = false
	%StockpileButtons.visible = false
	%CancelButtons.visible = false

func _on_create_zone_pressed() -> void:
	startZoning.emit()
	%StockpileButtons.visible = false
	%CancelButtons.visible = true
