extends CharacterBody2D

@export_subgroup("Components")
@export var gravity_component: GravityComponent

func _physics_process(delta):
	gravity_component.handle_gravity(self, delta)
	
	move_and_slide()
