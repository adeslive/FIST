extends Button


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Button_pressed():
	
	global.running = true
	get_tree().change_scene("res://escenas/juego.tscn")
	
	pass 
