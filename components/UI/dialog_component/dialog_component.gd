extends Control

signal dialog_ended

@export var dialog: PackedStringArray

var dialog_index = 0

func _ready():
	_load_dialog()

func _load_dialog():
	if !dialog_index < len(dialog):
		dialog_ended.emit()
	else:
		$Panel/RichTextLabel.text = dialog[dialog_index]
		dialog_index += 1

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		_load_dialog()
