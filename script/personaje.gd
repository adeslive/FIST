extends KinematicBody2D

var mouse_pos
onready var proyec = preload("res://escenas/proyectil.tscn")
var proyectil
var idle = preload("res://sprites/mc/mc1.png")

func _ready():
	
	name = "Personaje"
	set_process_input(true)
	pass


func _process(delta):
	
	if Input.is_action_just_pressed("lft_btn") and global.shoot_bool:
		self.shoot()
		global.shoot_bool = false
	pass


func shoot():
	
	proyectil = proyec.instance()
	proyectil.position = self.global_position
	proyectil.motion = mouse_pos
	proyectil.rotation = deg2rad(90*global.shoot_pos)
	get_node("proyec_contenedor").add_child(proyectil)
	get_node("Sprite").set_scale(Vector2(2.909091,2.909091))
	yield(utils.create_timer(0.1),"timeout")
	get_node("Sprite").set_texture(idle)
