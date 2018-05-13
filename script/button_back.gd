extends Button


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Button_pressed():
	
	get_parent().get_node("spawn").get_node("contenedor").queue_free()
	get_tree().change_scene("res://escenas/title.tscn")
	global.stop()
	global.points = 0

	pass
