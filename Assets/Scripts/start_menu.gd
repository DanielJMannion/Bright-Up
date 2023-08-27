extends Control

@onready var container = $Buttons
@onready var startBtn = $Buttons/StartButton
@onready var quitBtn = $Buttons/QuitButton

# Called when the node enters the scene tree for the first time.
func _ready():
	container.set_alignment(2)
	startBtn.pressed.connect(start)
	quitBtn.pressed.connect(quit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func start():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
	pass

func quit():
	get_tree().quit()
