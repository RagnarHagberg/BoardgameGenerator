extends TextureRect

#category, Question, lower_limit2, lower_limit3, lower_limit4, lower_limit6, correct, higher_limit

var data = {}
var card_fields = 0


func set_card_values(loop_index):
	loop_index = str(loop_index)
	get_node(str(loop_index) + "question").text = data["Fråga"]
	get_node(str(loop_index) + "answer").text = data["Rätt svar"]
	var low2 = int(data["Lägre gräns 2p"])
	var low3 = int(data["Lägre gräns 3p"])
	var low4 = int(data["Lägre gräns 4p"])
	var low6 = int(data["Lägre gräns 6p"])
	var high6 = int(data["Övre gräns 6p"])
	var high4 = int(data["Övre gräns 4p"])
	var high3 = int(data["Övre gräns 3p"])
	var high2 = int(data["Övre gräns 2p"])
	
	if (low2 + 1 == low3):
		get_node(loop_index + "2low").text = str(low2)
	else:
		get_node(loop_index + "2low").text = str(low2) + " - " + str(low3 - 1)

	if (low3 + 1 == low4):
		get_node(loop_index + "3low").text = str(low3)
	else:
		get_node(loop_index + "3low").text = str(low3) + " - " + str(low4 - 1)

	if (low4 + 1 == low6):
		get_node(loop_index + "4low").text = str(low4)
	else:
		get_node(loop_index + "4low").text = str(low4) + " - " + str(low6 - 1)

	if (low6 == high6):
		get_node (loop_index + "6").text = str(low6)
	else:
		get_node (loop_index + "6").text = str(low6) + " - " + str(high6);

	if (high6 + 1 == high4):
		get_node (loop_index + "4high").text = str(high4)
	else:
		get_node (loop_index + "4high").text = str(high6 + 1) + " - " + str(high4)

	if (high4 + 1 == high3):
		get_node (loop_index + "3high").text = str(high3)
	else:
		get_node (loop_index + "3high").text = str(high4 + 1) + " - " + str(high3)

	if (high3 + 1 == high2):
		get_node (loop_index + "2high").text = str(high2)
	else:
		get_node (loop_index + "2high").text = str(high3 + 1) + " - " + str(high2)


func set_data(new_data, loop_index):
	data = new_data
	set_card_values(loop_index)
