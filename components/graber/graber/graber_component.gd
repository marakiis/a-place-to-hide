class_name GrabberComponent
extends Node

@export_category("Settings")
@export var grabbing_position: Node2D
@export var drop_position: Node2D

var grabbed_object: Node2D

func handle_grab(target: Node2D, grabbing: bool):
	if grabbing:
		if grabbed_object == null:
			grabbed_object = target
		if grabbed_object != null:
			grabbed_object.set_physics_process(false)
			grabbed_object.global_position = grabbing_position.global_position
	else:
		if grabbed_object != null:
			grabbed_object.global_position = drop_position.global_position
			grabbed_object.set_physics_process(true)
			grabbed_object = null
