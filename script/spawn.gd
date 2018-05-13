extends Node


const enem = preload("res://escenas/enemigo.tscn")
var texture


func _ready():
	
	yield(utils.create_timer(1),"timeout")
	spawn()
	
	pass


func spawn():
	
	var contenedor = get_node("contenedor")
	
	while global.running:
		randomize()
		var enemigo = enem.instance()
		var enemigo_sprite = enemigo.get_node("Sprite")
		
		global.e_pos = int(rand_range(0,4))
		enemigo.vida = global.probVida()
		mov_enemigo(enemigo)
		
		if global.e_pos == 0:
			enemigo_sprite.set_texture(texture[0])
			enemigo.position = Vector2(512,64)
		elif global.e_pos  == 1:
			enemigo_sprite.set_texture(texture[1])
			enemigo.position = Vector2(512,576)
		elif global.e_pos  == 2:
			enemigo_sprite.set_texture(texture[3])
			enemigo.position = Vector2(96,320)
		else:
			enemigo_sprite.set_texture(texture[2])
			enemigo.position = Vector2(928,320)
		
		enemigo_sprite.set_scale(Vector2(0.666667,0.666667))
		contenedor.add_child(enemigo)
		var d = global.get_process_delta_time()
		
		yield(utils.create_timer(1.1 - d*global.spawn_delay),"timeout")
		
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