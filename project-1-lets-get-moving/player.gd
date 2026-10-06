extends AnimatedSprite2D

var move_speed = 100.0
var normal_speed = 100.0
var sprint_speed = 200.0
var frame_red = true
var frame_purple = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = 0
	frame_red = true
	frame_purple = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# Sprint input includes animation change (thrusters depending on sprite color).
func _process(delta: float) -> void:
	if Input.is_action_pressed("sprint") and frame_red:
		move_speed = sprint_speed
		frame = 1
	if Input.is_action_just_released("sprint") and frame_red:
		move_speed = normal_speed
		frame = 0
	if Input.is_action_pressed("sprint") and frame_purple:
		move_speed = sprint_speed
		frame = 3
	if Input.is_action_just_released("sprint") and frame_purple:
		move_speed = normal_speed
		frame = 2
# Basic directional inputs include directional rotation of the sprite.
	if Input.is_action_pressed("move_right"):
		position += Vector2(1,0) * move_speed * delta
		rotation_degrees = 90.0
	if Input.is_action_pressed("move_left"):
		position += Vector2(-1,0) * move_speed * delta
		rotation_degrees = 270.0
	if Input.is_action_pressed("move_up"):
		position += Vector2(0,-1) * move_speed * delta
		rotation_degrees = 0.0
	if Input.is_action_pressed("move_down"):
		position += Vector2(0,1) * move_speed * delta
		rotation_degrees = 180.0
	if Input.is_action_just_pressed("teleport"):
		global_position = get_global_mouse_position()
# Diagonal rotation for if two directional inputs are pressed at once:
	if Input.is_action_pressed("move_right") and Input.is_action_pressed("move_up"):
		rotation_degrees = 45.0
	if Input.is_action_pressed("move_right") and Input.is_action_pressed("move_down"):
		rotation_degrees = 135.0
	if Input.is_action_pressed ("move_left") and Input.is_action_pressed("move_up"):
		rotation_degrees = 315.0
	if Input.is_action_pressed("move_left") and Input.is_action_pressed("move_down"):
		rotation_degrees = 225.0
# Cyclical color changing input with variable tracking:
	if Input.is_action_just_pressed("change_color") and frame_red and not frame_purple:
		frame = 2
		frame_red = false
		frame_purple = true
	if Input.is_action_just_pressed("change_color") and frame_purple and not frame_red:
		frame = 0
		frame_red = true
		frame_purple = false
	pass
