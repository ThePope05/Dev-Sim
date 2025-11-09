extends StaticBody3D

@onready var camera = get_node("/root/GameScene/MoveableCamera3D")
@onready var coffee_view_position = get_node("/root/GameScene/CoffeeMachineViewPosition")

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Coffee mug clicked!")
		move_camera_to_coffee_machine()

@onready var back_button = get_node("/root/GameScene/UI/BackToDeskButton")

func move_camera_to_coffee_machine():
	# Save current position before moving
	back_button.desk_position = camera.position
	back_button.desk_rotation = camera.rotation
	
	# Disable mouse control
	camera.mouse_control_enabled = false
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(camera, "position", coffee_view_position.position, 1.0)
	tween.tween_property(camera, "rotation", coffee_view_position.rotation, 1.0)
	
	# Show button when tween finishes
	await tween.finished
	back_button.visible = true
	print("Camera arrived at coffee machine!")
