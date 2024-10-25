extends Node2D



var information_dictionary = {}
var example_dict = {}

var card_scene : PackedScene = load("res://card.tscn")
var filepath = ""
var savepath = ""

func read_data():
	 #var file = File.new()
	#file.open("res://Data/example.txt", file.READ)
	#above lines changed as of Godot 4 updated 6/5/2024
	var file = FileAccess.open(filepath, FileAccess.READ)
	
	var headers = file.get_csv_line()
	
	for header in headers:
		information_dictionary[header] = []

	print(headers)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		var i = 0
		for header in headers:
			print(data_set)
			if data_set == [""]: #slutar inte ordentligt
				break
			information_dictionary[header].append(data_set[i])
			i += 1
	file.close()
	print(information_dictionary)


func create_cards():
	for row in range(information_dictionary["Kategori"].size()):
		var dictionary_line = {}
		for key in information_dictionary.keys():
			print(key, row)
			dictionary_line[key] = information_dictionary[key][row]
		var card_instance = card_scene.instantiate()
		card_instance.set_data(dictionary_line)
		get_node("Cards").add_child(card_instance)
		if await render_shot(row):
			continue
	
func render_shot(number):
	
	await RenderingServer.frame_post_draw
	var image_region = Rect2i(0,0,576,326)
	var capture = get_viewport().get_texture().get_image().get_region(image_region)
	var _time = Time.get_datetime_string_from_system()
	var filename = "res://{1}{0}.png".format({"0":number, "1": savepath})
	capture.save_png(filename)
	return true
	
	
func _ready() -> void:
	await RenderingServer.frame_post_draw
	get_node("FileDialog").show()
	get_node("FileDialog/FileDialog").show()
	get_node("EnterSavePath").hide()


	
	#get_node("Panel/Question").text = 
	# get_node("Panel/Answer").text = 


func _on_file_dialog_file_selected(path: String) -> void:
	filepath = path
	print("selected")
	
	get_node("FileDialog").hide()
	get_node("EnterSavePath").show()


func _on_restart_pressed() -> void:
	for child in get_node("Cards").get_children():
		get_node("Cards").remove_child(child)
	get_node("FileDialog").show()
	get_node("FileDialog/FileDialog").show()


func _on_continue_pressed() -> void:
	if get_node("EnterSavePath/LineEdit").text != "":
		savepath = get_node("EnterSavePath/LineEdit").text
		get_node("EnterSavePath").hide()
		read_data()
		create_cards()