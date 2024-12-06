extends ColorRect

#category, Question, lower_limit2, lower_limit3, lower_limit4, lower_limit6, correct, higher_limit

var data = {}
func set_card_values():
	print(data)
	get_node("Panel/Question").text = data["Fråga"]
	get_node("Panel/Answer").text = data["Rätt svar"]
	var low2 = int(data["Lägre gräns 2p"])
	var low3 = int(data["Lägre gräns 3p"])
	var low4 = int(data["Lägre gräns 4p"])
	var low6 = int(data["Lägre gräns 6p"])
	var high6 = int(data["Övre gräns 6p"])
	var high4 = int(data["Övre gräns 4p"])
	var high3 = int(data["Övre gräns 3p"])
	var high2 = int(data["Övre gräns 2p"])

	if (low2 + 1 == low3):
		get_node("Panel/Control/ColorRect/Lower2").text = str(low2)
	else:
		get_node("Panel/Control/ColorRect/Lower2").text = str(low2) + " - " + str(low3 - 1)

	if (low3 + 1 == low4):
		get_node("Panel/Control/ColorRect2/Lower3").text = str(low3)
	else:
		get_node("Panel/Control/ColorRect2/Lower3").text = str(low3) + " - " + str(low4 - 1)

	if (low4 + 1 == low6):
		get_node("Panel/Control/ColorRect3/Lower4").text = str(low4)
	else:
		get_node("Panel/Control/ColorRect3/Lower4").text = str(low4) + " - " + str(low6 - 1)

	if (low6 == high6):
		get_node ("Panel/Control/ColorRect4/Right").text = str(low6)
	else:
		get_node ("Panel/Control/ColorRect4/Right").text = str(low6) + " - " + str(high6);

	if (high6 + 1 == high4):
		get_node ("Panel/Control/ColorRect5/Upper4").text = str(high4)
	else:
		get_node ("Panel/Control/ColorRect5/Upper4").text = str(high6 + 1) + " - " + str(high4)

	if (high4 + 1 == high3):
		get_node ("Panel/Control/ColorRect6/Upper3").text = str(high3)
	else:
		get_node ("Panel/Control/ColorRect6/Upper3").text = str(high4 + 1) + " - " + str(high3)

	if (high3 + 1 == high2):
		get_node ("Panel/Control/ColorRect7/Upper2").text = str(high2)
	else:
		get_node ("Panel/Control/ColorRect7/Upper2").text = str(high3 + 1) + " - " + str(high2)


func set_data(new_data):
	data = new_data
	set_card_values()
