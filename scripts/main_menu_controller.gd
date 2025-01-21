extends Node2D


func _on_generera_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")

func _on_redigera_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/card_editor.tscn")
