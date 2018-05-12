extends MenuButton


var popup
onready var dificultad_label = get_parent().get_node("HBoxContainer/CenterContainer/VBoxContainer/Dificultad")

func _ready():
	
	popup = get_popup()
	popup.add_item("Facil")
	popup.add_item("Medio")
	popup.add_item("Dificil")
	popup.connect("id_pressed",self, "_on_item_pressed")


func _on_item_pressed(ID):
	dificultad_label.set_text(popup.get_item_text(ID))
	global.dif = (ID)^2
