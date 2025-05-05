extends Node2D

@export var cube_scene: PackedScene

var spawn_x_max = 260
var spawn_x_min = 115
var score = 0
var is_game_over = false

func _process(_delta):
	$UI/Panel/Score.text = str(score)
	if is_game_over && Input.is_action_just_pressed("ui_accept"):
		Global.game_over()

func _on_timer_timeout():
	spawnCube()

func spawnCube():
	var cube = getCubeFromList()
	cube.global_position.x = randf_range(spawn_x_min, spawn_x_max)
	add_child(cube)

func getCubeFromList() -> Node2D:
	return cube_scene.instantiate()

func game_over():
	is_game_over = true
	$Table.set_physics_process(false)
	$GameOver.visible = true
	$Timer.stop()

func _on_child_body_entered(_body):
	game_over()

func _on_dump_dump_triggered():
	score += 1
