extends Camera3D
class_name MoveableCamera3D

@export var mouse_influence: float = 0.5
@export var rotation_speed: float = 5.0
@export var min_rotation_limit: Vector3 = Vector3(-10, -20, 0)
@export var max_rotation_limit: Vector3 = Vector3(10, 20, 0)
@export var reset_on_idle: bool = true

var _target_rotation: Vector3

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	_target_rotation = rotation_degrees

func _process(delta):
	var viewport_size = get_viewport().get_visible_rect().size
	var mouse_pos = get_viewport().get_mouse_position()
	var center = viewport_size * 0.5
	
	# How far the mouse is from the center (normalized to -1..1)
	var offset = (mouse_pos - center) / center
	offset = offset.clamp(Vector2(-1, -1), Vector2(1, 1))
	
	# Calculate target rotation based on offset and influence
	_target_rotation.x = lerp(
		min_rotation_limit.x,
		max_rotation_limit.x,
		-offset.y * mouse_influence
	)
	_target_rotation.y = lerp(
		min_rotation_limit.y,
		max_rotation_limit.y,
		-offset.x * mouse_influence
	)

	
	# Clamp rotations
	#_target_rotation.x = clamp(_target_rotation.x, min_rotation_limit.x, max_rotation_limit.x)
	#_target_rotation.y = clamp(_target_rotation.y, min_rotation_limit.y, max_rotation_limit.y)

	# Apply rotation smoothly
	rotation_degrees = _target_rotation
