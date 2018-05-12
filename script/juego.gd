extends Node

onready var puntajeV = get_node("Label")
onready var fin = get_node("msj")

var points_old = 0

func _ready():
	pass

func _process(delta):
	self.update_points()
	pass

func update_points():
	if points_old != global.points:
		puntajeV.set_text(str(global.points))
		points_old = global.points
	if !global.running:
		fin.set_visible(true) 
