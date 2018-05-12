extends Area2D


const SPEED = 450
var local_vel_x = global.vel_x
var local_vel_y = global.vel_y
var motion


func _ready():
	
	set_process(true)
	pass


func _process(delta):
	
	motion = Vector2(local_vel_x, local_vel_y)*SPEED
	self.position = self.position + motion*delta


func _on_proyectil_area_entered(area):
	
	if "enemigo" in area.name:
		area.vida -= 1
	
		if area.vida == 0:
			global.points += 1
			area.queue_free()
		
		queue_free()
	pass 
