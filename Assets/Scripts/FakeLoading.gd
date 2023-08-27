extends ColorRect

@onready var audio = $Audio
@onready var audio2 = $"Audio 2"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.show()
	audio.play()
	await get_tree().create_timer(0.6).timeout
	audio2.play()
	self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
