extends Node2D

@onready var light = $Light
@onready var player = $Player
@onready var grid = $TileMap
@onready var canEnd = $LevelEnd
@onready var endScreen = $LevelComplete
@onready var pauseScreen = $pauseScreen
@onready var progress = get_node("/root/Progress")

var mousePosition = null
var canMoveLight = true
var darkPlat = preload("res://Assets/Objects/dark_platform.tscn")
var lightPlat = preload("res://Assets/Objects/light_platform.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for cellPos in grid.get_used_cells(1):
		var cellType = grid.get_cell_tile_data(1, cellPos).get_custom_data("dark")
		var cell = grid.get_cell_tile_data(1, cellPos).get_custom_data("SpriteNumb")
		if cellType:
			var object = darkPlat.instantiate()
			object.position = grid.map_to_local(cellPos) * grid.scale
			object.get_node("Sprite2D").frame = cell
			add_child(object)
			grid.set_cell(1, cellPos, -1)
		else:
			var object = lightPlat.instantiate()
			object.position = grid.map_to_local(cellPos) * grid.scale
			object.get_node("Sprite2D").frame = cell
			add_child(object)
			grid.set_cell(1, cellPos, -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	mousePosition = get_global_mouse_position()
	if Input.is_action_just_pressed("ui_up") and canEnd.canEnd and player.canInput:
		endScreen.show()
		player.canInput = false
		canMoveLight = false
		progress.beatLevel(self.name)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and canMoveLight:
		#light.position = mousePosition
		tweenLight(mousePosition, 0.1)
	else:
		#light.position = player.position
		tweenLight(player.position, 0.001)
	
	if Input.is_action_pressed("ui_cancel"):
		pauseScreen.show()
	
	if pauseScreen.is_visible_in_tree() == true:
		canMoveLight = false
		player.canInput = false
	else:
		canMoveLight = true
		player.canInput = true

func tweenLight(newPosition, time):
	set_process(false)
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_OUT_IN)
	tween.tween_property(light, "position", newPosition, time)
	await tween.finished
	
	set_process(true)
