extends Control

@onready var plaatje = $Opdracht/design/plaatje
@onready var titel_opdracht = $Opdracht/titel_opdracht

func _on_user_pressed(imgPath : String, title : String) -> void:
	plaatje.texture = load(imgPath)
	titel_opdracht.text = title
