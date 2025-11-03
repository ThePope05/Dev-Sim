extends TextureRect

class_name ClickableTextureRect

@export var ElementScreen : Control
@export var Element : PackedScene

func _gui_input(event):
	if event is not InputEventMouseButton or event.button_index != MOUSE_BUTTON_LEFT:
		return
	
	var mouseEvent : InputEventMouseButton = event
	if !mouseEvent.is_released():
		return
	
	ElementScreen.add_child(Element.instantiate())
