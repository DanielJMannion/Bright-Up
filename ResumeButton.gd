extends TextureButton


func _ready():
	self.pressed.connect(resume)

func resume():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
