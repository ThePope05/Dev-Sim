extends Control

@onready var plaatje = $Opdracht/design/plaatje
@onready var titel_opdracht = $Opdracht/titel_opdracht
@onready var start_button: Button = $Opdracht/Start_button

var current_assignment: String
var is_doing_assignment: bool = false

signal _start_assignment
signal _stop_assignment

func _on_user_pressed(imgPath : String, title : String) -> void:
	plaatje.texture = load(imgPath)
	titel_opdracht.text = title
	current_assignment = title

func _start_stop_assignment():
	if not is_doing_assignment:
		_start_assignment.emit(current_assignment)
		start_button.text = "Lever opdracht in"
	else:
		_stop_assignment.emit()
		start_button.text = "Start opdracht"
	
	is_doing_assignment = !is_doing_assignment
