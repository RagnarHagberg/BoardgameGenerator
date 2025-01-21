extends Node2D


var settings_menu_is_open: bool = false
var image_path : String
var save_path : String

func _ready() -> void:
	get_node("PopupPanel").hide()
	
	get_node("SelectPicturePanel").hide()
	get_node("SelectPicturePanel/FileDialog").hide()
	
	get_node("EnterSavePath").show()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		get_node("Label").text = str(get_global_mouse_position())

func _on_file_dialog_file_selected(path: String) -> void:
	get_node("SelectPicturePanel").hide()
	image_path = path
	get_node("CardTexture").texture = load(path)
	get_node("CardTexture").size.x = get_window().size.x
	if get_node("CardTexture").size.y > get_window().size.y:
		get_node("CardTexture").size.y = get_window().size.y


func _on_open_change_menu_pressed() -> void:
	if settings_menu_is_open:
		get_node("PopupPanel").hide()
		get_node("OpenChangeMenu").text = "Sätt text"
		settings_menu_is_open = false
	else:
		get_node("PopupPanel").show()
		get_node("OpenChangeMenu").text = "Göm"
		settings_menu_is_open = true
	


func save_data() -> void:
	var input_containers = $PopupPanel/Panel/VBoxContainer.get_children()
	
	# save data to cardData
	
	var card_data = CardData.new()
	
	var card_datas = []
	for input_container in input_containers:
		card_datas.append(input_container.data)
	
	card_data.image_path = image_path
	card_data.card_datas = card_datas
	card_data.card_fields = get_node("PopupPanel/Panel").previous_value
	
	var filesavepath = save_path + ".tres"
	ResourceSaver.save(card_data, filesavepath)


func _on_save_button_pressed() -> void:
	save_data()


func _on_continue_pressed() -> void:
	if get_node("EnterSavePath/LineEdit").text != "":
		save_path = get_node("EnterSavePath/LineEdit").text
		get_node("EnterSavePath").hide()
	
	get_node("SelectPicturePanel").show()
	get_node("SelectPicturePanel/FileDialog").show()


func _on_return_to_main_button_pressed() -> void:
	save_data()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
