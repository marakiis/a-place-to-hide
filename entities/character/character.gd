extends CharacterBody2D

@export_subgroup("Components")
@export var animation_component: AnimationComponent
@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var selector_component: SelectorComponent
@export var grabber_component: GrabberComponent

var grabbing_distance: float


func _ready():
	animation_component.sprite.play("idle")
	grabbing_distance = abs(self.grabber_component.drop_position.position.x)

func _physics_process(delta):
	gravity_component.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, input_component.input_horizontal)
	if input_component.input_horizontal != 0:
		grabber_component.drop_position.position.x = grabbing_distance * input_component.input_horizontal
		
	grabber_component.handle_grab(selector_component.selected, input_component.get_grab_input())
	animation_component.handle_move_animation(input_component.input_horizontal)
	
	move_and_slide()
	
	# Clamp
	global_position = global_position.clamp(Vector2(50, -100), Vector2(430, 800))
	pass
