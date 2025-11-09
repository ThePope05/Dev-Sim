extends Panel

@onready var element_screen : ColorRect = $Background
@onready var wallpaper: MarginContainer = $Background/Wallpaper

func _add_element_to_screen(element : Control) -> void:
	element_screen.add_child(element)

func _start_assignment(name: String) -> void:
	for child in element_screen.get_children():
		if not child.name.containsn("wallpaper"):
			element_screen.remove_child(child)
		
	var design : PackedScene
	
	if name.containsn("profile page"):
		design = load("res://assets/prefabs/Designs/design_portfolio.tscn")
	if name.containsn("welcome page"):
		design = load("res://assets/prefabs/Designs/design_welcome.tscn")
	if name.containsn("landing page"):
		design = load("res://assets/prefabs/Designs/design_landing.tscn")
	if name.containsn("product page"):
		design = load("res://assets/prefabs/Designs/design_product.tscn")
	
	if design == null:
		return
	
	element_screen.color = "#fff"
	wallpaper.visible = false
	element_screen.add_child(design.instantiate())

func _stop_assignment() -> void:
	for child in element_screen.get_children():
		if not child.name.containsn("wallpaper"):
			element_screen.remove_child(child)
	
	element_screen.color = "#000"
	wallpaper.visible = true
