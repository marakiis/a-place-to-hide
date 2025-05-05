extends Node2D

func _ready():
	$Table.set_physics_process(false)
	$Persona.set_physics_process(false)

func _on_dialog_component_dialog_ended():
	$Tutorial.visible = false
	$Persona.set_physics_process(true)

func _on_dump_dump_triggered():
	Global.next_scene()
