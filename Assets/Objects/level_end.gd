extends Area2D

var canEnd = false

func _on_body_entered(_body):
	print("End Time")
	canEnd = true

func _on_body_exited(_body):
	canEnd = false
