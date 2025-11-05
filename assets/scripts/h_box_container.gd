extends Control

@onready var plaatje = $Opdracht/design/plaatje

func _on_vries_pressed() -> void:
	plaatje.texture = preload("res://assets/images/Screenshots/Screenshot 2025-10-31 144733.png")


func _on_koster_pressed() -> void:
	plaatje.texture = preload("res://assets/images/Screenshots/Screenshot 2025-10-31 144306.png")


func _on_bakker_pressed() -> void:
	plaatje.texture = preload("res://assets/images/Screenshots/Screenshot 2025-10-31 144210.png")


func _on_vermeer_pressed() -> void:
	plaatje.texture = preload("res://assets/images/Screenshots/Screenshot 2025-10-31 144503.png")
