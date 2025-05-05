extends Area2D

signal dump_triggered

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	dump_triggered.emit()
	body.queue_free()
