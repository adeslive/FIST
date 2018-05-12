extends Node


onready var viewport = get_viewport()

var dif = 0
var points = 0
var spawn_delay = 10*dif
var vel_x = 0
var vel_y = 0
var e_pos = 0
var running = false
var shoot_bool = false


var shoot_pos = 0

func stop():
	shoot_bool = false
	running = false
	vel_x = 0
	vel_y = 0
	e_pos = -1

func probVida():
	randomize()
	var den
	var P1
	var P23
	var P4
	
	den = exp(points-15) + 2*points + exp(10-points)
	
	P1 = 100 * exp(7-points)/den
	P23 = 100 * points/den
	P4 = 100 * exp(points-20)/den
	
	var aleatorio = float(rand_range(0,4)) #minimo 0, maximo 100
	if(aleatorio <= P4):
		return 4
	elif(aleatorio <= P4 + P23):
		return 2
	elif(aleatorio <= P4 + 2*P23): #la propabilidad de 2 y 3 vidas es la misma
		return 3
	else: #la suma de todos es 100, asi que no es necesario poner aleatorio<=100
		return 1