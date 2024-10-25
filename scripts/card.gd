extends ColorRect

#category, Question, lower_limit2, lower_limit3, lower_limit4, lower_limit6, correct, higher_limit

var data = {}
func set_card_values():
	print(data)
	get_node("Panel/Question").text = data["Fråga"]
	get_node("Panel/Answer").text = data["Kommentar"]
	get_node("Panel/Control/ColorRect/Lower2").text = data["Lägre gräns 2p"] + "-" + data["Lägre gräns 3p"]
	get_node("Panel/Control/ColorRect2/Lower3").text = data["Lägre gräns 3p"] + "-" + data["Lägre gräns 4p"]
	get_node("Panel/Control/ColorRect3/Lower4").text = data["Lägre gräns 4p"] + "-" + data["Lägre gräns 6p"]
	get_node("Panel/Control/ColorRect4/Right").text = data["Lägre gräns 6p"] + "-" + data["Övre gräns 6p"]
	get_node("Panel/Control/ColorRect5/Upper4").text = data["Övre gräns 6p"] + "-" + data["Övre gräns 4p"]
	get_node("Panel/Control/ColorRect6/Upper3").text = data["Övre gräns 4p"] + "-" + data["Övre gräns 3p"]
	get_node("Panel/Control/ColorRect7/Upper2").text = data["Övre gräns 3p"] + "-" + data["Övre gräns 2p"]

func set_data(new_data):
	data = new_data
	set_card_values()
