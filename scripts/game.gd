extends Node2D



var information_dictionary = {}
var example_dict = {}

var card_fields = 2

var card_data_path := ""
var card_data #= ResourceLoader.load("res://test_data.tres")

var filepath = ""
var savepath = ""

var card_creator = CardCreator.new()



func read_data():
	var file = FileAccess.open(filepath, FileAccess.READ)
	
	var headers = file.get_csv_line()
	
	for header in headers:
		information_dictionary[header] = []
	
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		var i = 0
		for header in headers:
			if data_set == [""]: #slutar inte ordentligt
				break
			information_dictionary[header].append(data_set[i])
			i += 1
	file.close()


func create_and_render_cards():
	
	# måste öka row inte loop_index, nu är row samma
	for row in range(0, information_dictionary["Kategori"].size(), card_data.card_fields):
		var card_instance = card_creator.create_card(card_data, get_window().size)
		for loop_index in card_instance.card_fields:
			if row+loop_index > information_dictionary["Kategori"].size()-1:
				continue
			var dictionary_line = {}
			for key in information_dictionary.keys():
				#print(key, row+loop_index)
				dictionary_line[key] = information_dictionary[key][row+loop_index]
			print(dictionary_line)
			card_instance.set_data(dictionary_line, loop_index)
		#print(card_instance.get_children()[0].text)
		get_node("Cards").add_child(card_instance)
		if await render_shot(row, card_instance.get_size()):
			continue
	
	get_node("Cards").hide()
	get_node("FinishedPanel").show()


func render_shot(number, card_size):
	await RenderingServer.frame_post_draw
	var image_region = Rect2i(0,0,card_size.x, card_size.y)
	var capture = get_viewport().get_texture().get_image().get_region(image_region)
	var _time = Time.get_datetime_string_from_system()
	var filename = "user://{1}".format({"1": savepath}) + "%03d" % number + ".png"
	capture.save_png(filename)
	print("saved card")
	return true
	
	
func _ready() -> void:
	await RenderingServer.frame_post_draw
	get_node("FileDialog").show()
	get_node("FileDialog/FileDialog").show()
	
	get_node("FinishedPanel").hide()
	
	get_node("FileDialog2").hide()
	get_node("FileDialog2/FileDialogCardData").hide()
	
	get_node("EnterSavePath").hide()


	
	#get_node("Panel/Question").text = 
	# get_node("Panel/Answer").text = 


func _on_file_dialog_file_selected(path: String) -> void:
	filepath = path
	print("selected")
	
	get_node("FileDialog").hide()
	get_node("FileDialog2").show()
	get_node("FileDialog2/FileDialogCardData").show()


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	#for child in get_node("Cards").get_children():
	#	get_node("Cards").remove_child(child)
	#get_node("FileDialog").show()
	#get_node("FileDialog/FileDialog").show()


func _on_continue_pressed() -> void:
	if get_node("EnterSavePath/LineEdit").text != "":
		savepath = get_node("EnterSavePath/LineEdit").text
		get_node("EnterSavePath").hide()
		read_data()
		create_and_render_cards()


func _on_file_dialog_card_data_file_selected(path: String) -> void:
	card_data_path = path
	card_data = ResourceLoader.load(path)
	
	get_node("FileDialog2").hide()
	get_node("FileDialog2/FileDialogCardData").hide()
	
	get_node("EnterSavePath").show()
