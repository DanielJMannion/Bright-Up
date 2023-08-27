extends ColorRect

@onready var audio = $Audio
@onready var audio2 = $"Audio 2"
@onready var dan = $Dan

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.6).timeout
	
	self.show()
	dan.show()
	audio.play()
	await get_tree().create_timer(1.0).timeout
	
	audio2.play()
	dan.hide()
	await get_tree().create_timer(0.6).timeout
	
	audio.play()
	self.hide()
