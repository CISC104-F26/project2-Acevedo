extends MeshInstance3D

var move_speed = 3.0
var normal_speed = 3.0
var sprint_speed = 6.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("sprint"):
		move_speed = sprint_speed
	if Input.is_action_just_released("sprint"):
		move_speed = normal_speed
	if Input.is_action_pressed("move_east"):
		position += Vector3(1,0,0) * move_speed * delta
	if Input.is_action_pressed("move_west"):
		position += Vector3(-1,0,0) * move_speed * delta
	if Input.is_action_pressed("move_north"):
		position += Vector3(0,0,-1) * move_speed * delta
	if Input.is_action_pressed("move_south"):
		position += Vector3(0,0,1) * move_speed * delta
	if Input.is_action_pressed("pitch_up"):
		position += Vector3(0,1,0) * move_speed * delta
	if Input.is_action_pressed("pitch_down"):
		position += Vector3(0,-1,0) * move_speed * delta
	pass
