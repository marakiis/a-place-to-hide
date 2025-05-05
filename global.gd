extends Node

@onready var intro_scene = preload("res://level/intro.tscn")
@onready var tutorial_scene = preload("res://level/tutorial.tscn")
@onready var game_scene = preload("res://level/game.tscn")
@onready var outro_scene = preload("res://level/outro.tscn")

var current_scene = "intro"

func _ready():
	randomize()
	current_scene = "intro"

func next_scene():
	match current_scene:
		"intro":
			get_tree().change_scene_to_packed(tutorial_scene)
			current_scene = "tutorial"
		"tutorial":
			get_tree().change_scene_to_packed(game_scene)
			current_scene = "game"
		"game":
			get_tree().change_scene_to_packed(outro_scene)
			current_scene = "outro"
		"outro":
			get_tree().change_scene_to_packed(intro_scene)
			current_scene = "intro"

func game_over():
	next_scene()
