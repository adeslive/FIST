extends Area2D


var event = InputEventScreenTouch
onready var parent = get_parent().get_node("Sprite")

func _ready():
	set_process_input(true)
	pass


func _input_event(viewport, event, shape_idx):
	
	if event.is_action_pressed("lft_btn"):
		if event.get_position().y < 256: # Norte
			global.vel_y = -1
			global.vel_x = 0
			global.shoot_pos = -1
			parent.set_texture(textures.PJ[0])
		if event.get_position().y > 384: # Sur
			global.vel_y = 1
			global.vel_x = 0
			global.shoot_pos = 1
			parent.set_texture(textures.PJ[1])
		if event.get_position().x < 448 and event.get_position().y < 384 and event.get_position().y > 256: # Este
			global.vel_x = -1
			global.vel_y = 0
			global.shoot_pos = -2
			parent.set_texture(textures.PJ[3])
		if event.get_position().x > 576 and event.get_position().y < 384 and event.get_position().y > 256: # Oeste
			global.vel_x = 1
			global.vel_y = 0
			global.shoot_pos = 4
			parent.set_texture(textures.PJ[2])
		global.shoot_bool = true
		
	pass

