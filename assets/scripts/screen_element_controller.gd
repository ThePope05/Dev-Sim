extends Panel

@onready var element_screen : Control = $Background

func _add_element_to_screen(element : DraggableTextureRect) -> void:
	element_screen.add_child(element)
