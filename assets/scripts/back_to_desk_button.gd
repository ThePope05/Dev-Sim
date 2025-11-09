extends Button

@onready var camera = get_node("/root/GameScene/MoveableCamera3D")

# Store the original desk position (we'll set this from CoffeeMug script)
var desk_position: Vector3
var desk_rotation: Vector3

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	print("Returning to desk...")
	return_to_desk()

func return_to_desk():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(camera, "position", desk_position, 1.0)
	tween.tween_property(camera, "rotation", desk_rotation, 1.0)
	
	# Wait for tween to finish, then re-enable mouse control and hide button
	await tween.finished
	camera.mouse_control_enabled = true
	visible = false
