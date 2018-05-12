extends Node


const enem = preload("res://escenas/enemigo.tscn")
var texture


func _ready():
	
	yield(utils.create_timer(1),"timeout")
	spawn()
	pass


func spawn():
	
	while global.running:
		randomize()
		var enemigo = enem.instance()
		
		global.e_pos = int(rand_range(0,4))
		enemigo.vida = global.probVida()
		mov_enemigo(enemigo)
		
		if global.e_pos == 0:
			enemigo.get_node("Sprite").set_texture(texture[0])
			enemigo.position = Vector2(512,64)
		elif global.e_pos  == 1:
			enemigo.get_node("Sprite").set_texture(texture[1])
			enemigo.position = Vector2(512,576)
		elif global.e_pos  == 2:
			enemigo.get_node("Sprite").set_texture(texture[3])
			enemigo.position = Vector2(96,320)
		else:
			enemigo.get_node("Sprite").set_texture(texture[2])
			enemigo.position = Vector2(928,320)
		enemigo.get_node("Sprite").set_scale(Vector2(0.666667,0.666667))
		get_node("contenedor").add_child(enemigo)
		yield(utils.create_timer(0.9 - global.get_process_delta_time()*global.spawn_delay),"timeout")
		
	pass


func mov_enemigo(enem):
	
	if enem.vida == 1:
		texture = textures.enem1
		enem.speed = 250
	elif enem.vida == 2:
		texture = textures.enem2
		enem.speed = 180
	elif enem.vida == 3:
		texture = textures.enem3
		enem.speed = 120
	elif enem.vida == 4:
		texture = textures.enem4
		enem.speed = 100
	
	pass