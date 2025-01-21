extends Panel

var text_input_group_scene : PackedScene = preload("res://Scenes/text_input_group.tscn")
var previous_value: int  = 1

func _on_h_slider_value_changed(value: float) -> void:
	if value == previous_value:
		return
	previous_value = int(value)
	var node = get_node("VBoxContainer")
	if value == 1:
		node.get_children()[1].queue_free()
	if value == 2:
		node.add_child(text_input_group_scene.instantiate())
		
