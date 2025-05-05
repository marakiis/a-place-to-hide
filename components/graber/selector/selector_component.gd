class_name SelectorComponent
extends Area2D

var selected

func _ready():
	connect("body_entered", _on_selector_body_entered)
	connect("body_exited", _on_selector_body_exited)

func _on_selector_body_entered(body):
	self.selected = body
	
func _on_selector_body_exited(body):
	if body == self.selected:
		self.selected = null
