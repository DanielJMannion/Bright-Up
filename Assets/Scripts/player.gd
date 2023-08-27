extends CharacterBody2D

@onready var sound = $Jump
@onready var dieSound = $Die
@onready var anim = $AnimationPlayer
@onready var icon = $Icon
@export var speed = 60
@export var jump = -250
var inAir = false
#var currentInput = 0
var lookAtLight = false
var canInput = true
var respawn = Vector2(0,0)

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	respawn = self.position

func _physics_process(delta):
	if(canInput):
		if not is_on_floor():
			velocity.y += gravity * delta
	
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = jump
			sound.play()
		
		var currentInput = Input.get_axis("ui_left", "ui_right")
		if currentInput:
			anim.play("move")
			velocity.x = currentInput * speed
		else:
			anim.stop()
			icon.frame = 0
			velocity.x = move_toward(velocity.x, 0, speed)
	
		move_and_slide()

func die():
	set_physics_process(false)
	dieSound.play()
	await get_tree().create_timer(0.5).timeout
	self.position = respawn
	set_physics_process(true)
