extends Control

var data : Dictionary = {"2low": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""},
						"3low": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""},
						"4low": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""},
						"6": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""},
						"4high": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""},
						"3high": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""},
						"2high": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""},
						"question": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""},
						"answer": {"px": 0, "py": 0, "width": 0, "height": 0, "color": ""}
}


func _on_px_text_changed(new_text: String, extra_arg_0: NodePath) -> void:
	data[str(extra_arg_0)]["px"] = int(new_text)


func _on_py_text_changed(new_text: String, extra_arg_0: NodePath) -> void:
	data[str(extra_arg_0)]["py"] = int(new_text)


func _on_width_text_changed(new_text: String, extra_arg_0: NodePath) -> void:
	data[str(extra_arg_0)]["width"] = int(new_text)


func _on_height_text_changed(new_text: String, extra_arg_0: NodePath) -> void:
	data[str(extra_arg_0)]["height"] = int(new_text)


func _on_color_picker_button_color_changed(color: Color, extra_arg_0: String) -> void:
	data[str(extra_arg_0)]["color"] = str(color.to_html())
