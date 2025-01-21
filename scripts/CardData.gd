extends Resource
class_name CardData

@export var card_datas : Array
# Array of dictionarys with this structure
'''
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


'''
@export var card_fields : int
@export var image_path : String

func _to_string() -> String:
	return image_path
