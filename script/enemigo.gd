extends Area2D

var vida = 2
var motion = Vector2()
var speed = 0
onready var local_e_pos = global.e_pos 
onready var vidaLabel = get_node("vida")

func _ready():
	if local_e_pos == 0:
		motion.y = speed
	elif local_e_pos == 1:
		motion.y = -speed
	elif local_e_pos == 2:
		motion.x = speed
	elif local_e_pos == 3:
		motion.x = -speed
	pass

func _physics_process(delta):
	if global.running:
		update_life()
		self.position = self.position + motion*delta
	pass
	

func update_life():
	vidaLabel.set_text(str(vida))


func _on_enemigo_body_entered(body):
	if body.name == "Personaje":
		body.queue_free()
		global.stop()
	pass 
