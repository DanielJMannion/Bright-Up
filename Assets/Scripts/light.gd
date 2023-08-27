extends Node2D

func _on_point_light_body_entered(body):
	if body.get_collision_layer_value(2):
		body.set_collision_layer_value(1, true)
	elif body.get_collision_layer_value(3):
		body.set_collision_layer_value(1, false)

func _on_point_light_body_exited(body):
	if body.get_collision_layer_value(2):
		body.set_collision_layer_value(1, false)
	elif body.get_collision_layer_value(3):
		body.set_collision_layer_value(1, true)

func _on_point_light_area_entered(area):
	if area.get_collision_layer_value(6):
		print("Dark spike on")
		area.set_collision_mask_value(5, true)
	elif area.get_collision_layer_value(7):
		print("Light spike off")
		area.set_collision_mask_value(5, false)

func _on_point_light_area_exited(area):
	if area.get_collision_layer_value(6):
		print("Dark spike off")
		area.set_collision_mask_value(5, false)
	elif area.get_collision_layer_value(7):
		print("Light spike on")
		area.set_collision_mask_value(5, true)
