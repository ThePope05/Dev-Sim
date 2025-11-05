extends StaticBody3D
# Called when the node enters the scene tree for the first time.
func _ready():
	input_event.connect(_on_input_event);

func _on_input_event(camera : Node, event : InputEvent, event_position : Vector3, normal : Vector3, shape_idx : int) -> void:
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		print("Something with this collision")
		
