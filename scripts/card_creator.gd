extends Node2D
class_name CardCreator

var card_scene : PackedScene = preload("res://Scenes/card_template.tscn")

func create_card(card_data : CardData, window_size):
	var card = card_scene.instantiate()
	card.card_fields = card_data.card_fields
	
	print(card_data.image_path)
	card.texture = load(card_data.image_path)

	
	var texture_size = load(card_data.image_path).get_size()
	
	card.size.x = 1
	card.size.y = texture_size.x
	
	if texture_size.y > window_size.y:
		card.size.y = window_size.y
	
	var index = 0
	for data in card_data.card_datas:
		for key in data.keys():
			var label = create_label(data[key]["px"], data[key]["py"], data[key]["width"], data[key]["height"], key, data[key]["color"], str(index))
			card.add_child(label)
		index += 1
	
	return card
	

func create_label(x_position, y_position, width, height, name, color, loop_index) -> Label:
	var new_label = Label.new()
	
	new_label.name = loop_index + name
	
	
	new_label.position.x = x_position
	new_label.position.y = y_position
	new_label.size.x = width
	new_label.size.y = height
	
	var new_font_color = Color.html(color)
	new_label.set("theme_override_colors/font_color", new_font_color)
	
	new_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	new_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	new_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	return (new_label)
