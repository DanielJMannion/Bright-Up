extends TextureButton

@onready var number = $Number
@onready var color = $ColorRect
@onready var progress = get_node("/root/Progress")

# Called when the node enters the scene tree for the first time.
func _ready():
	number.frame = self.get_meta("NumberTexture")
	self.pressed.connect(changeScene)
	if(progress.returnIfBeat(self.get_meta("SceneChange"))):
		color.show()

func changeScene():
	get_tree().change_scene_to_file("res://Scenes/Levels/" + self.get_meta("SceneChange") + ".tscn")
