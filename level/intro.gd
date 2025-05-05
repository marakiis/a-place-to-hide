extends Node2D

signal intro_ended

func _on_dialog_component_dialog_ended():
	Global.next_scene()
