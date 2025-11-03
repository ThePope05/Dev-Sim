# DraggableTextureRect.gd
extends TextureRect
class_name DraggableTextureRect

@export var snap_to_parent_bounds := true

var dragging := false
var drag_offset := Vector2.ZERO
var start_drag_offset := Vector2.ZERO;

func _ready():
	mouse_filter = Control.MOUSE_FILTER_STOP

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		var mouseEvent : InputEventMouseButton = event
		if mouseEvent.pressed:
			dragging = true
			drag_offset = get_global_mouse_position() - global_position
			grab_focus()
		else:
			dragging = false

	elif event is InputEventMouseMotion and dragging:
		var motionEvent : InputEventMouseMotion = event
		var new_pos = global_position + motionEvent.position - drag_offset
		if snap_to_parent_bounds:
			new_pos = new_pos.clamp(Vector2.ZERO, get_parent().size - (size * scale))
		global_position = new_pos
