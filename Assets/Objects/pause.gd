extends Control

@onready var resume = $resumeButton

# Called when the node enters the scene tree for the first time.
func _ready():
	resume.pressed.connect(resumeGame)

func resumeGame():
	self.hide()
