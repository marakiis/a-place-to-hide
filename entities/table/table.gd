extends CharacterBody2D

@export_category("Settings")
@export var accel: float = 0.5
@export var speed_by_load: float = 1

var tableLoad: float

func _on_cube_detector_body_entered(body):
	tableLoad = tableLoad + 10

func _on_cube_detector_body_exited(body):
	tableLoad = tableLoad - 10

func _physics_process(_delta):
	get_table_drop() 
	move_and_slide()

func get_table_drop():
	self.velocity.y = move_toward(self.velocity.y, tableLoad * speed_by_load, accel)
