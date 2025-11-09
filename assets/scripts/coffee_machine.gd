extends StaticBody3D

@onready var healthbar = get_node("/root/GameScene/UI/Healthbar")

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Coffee machine clicked! Refilling health...")
		refill_health()

func refill_health():
	# Add 60 to current health
	healthbar.health += 60
	print("Health refilled by 60! New health: ", healthbar.health)
