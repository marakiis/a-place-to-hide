class_name AnimationComponent
extends Node

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D

func handle_horizontal_flip(move_direction: float) -> void:
	if move_direction == 0:
		return 
	if move_direction > 0:
		sprite.flip_h = false 
	else:
		sprite.flip_h = true
	
func handle_move_animation(move_direction: float) -> void:
	handle_horizontal_flip(move_direction)

	if move_direction == 0: 
		sprite.play("idle")
	else: 
		sprite.play("walk")

func handle_jump_animation(is_jumping: bool, is_falling: bool) -> void:
	if is_jumping:
		sprite.play("jump")
	elif is_falling:
		sprite.play("fall")
