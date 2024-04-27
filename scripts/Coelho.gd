extends Node2D

var start_y
var start_x
var side_speed
var speed = 1500
var subindo = true
const GRAVITY = 27
const TAXA_DE_ENCOLHIMENTO = .99
const ROTATION_SPEED = 4
var rodando
var direction
const PRE_CACOS = preload("res://scenes/Cacos.tscn")

func _ready():
	$AnimationPlayer.play("default")
	randomize()
	start_x = get_random_start_x()
	start_y = get_random_start_y()
	side_speed = get_random_side_speed()
	rodando = randi() % 2 == 0
	direction = randi() % 2 == 0
	position.y = start_y
	position.x = start_x

func _process(delta):
	subir_e_descer(delta)
	ir_para_o_lado(delta)
	check_max_y()
	if rodando:
		rodar(delta)
	
func get_random_start_x():
	return randi() % (int(get_viewport_rect().size.x) - 100) + 50
	
func get_random_side_speed():
	var metade_da_tela = get_viewport_rect().size.x / 2
	var x_speed = (randi() % 6) - 3
	if (start_x < metade_da_tela) and x_speed < 0:
		x_speed *= -1
	elif (start_x > metade_da_tela) and x_speed > 0:
		x_speed *= -1
	return x_speed
	
func get_random_start_y():
	var random_number = (randi() % 300) + 50
	return get_viewport_rect().size.y + random_number

func subir_e_descer(delta):
	speed -= GRAVITY
	position.y -= speed * delta
	encolher()
	if speed < 0:
		subindo = false
		
func ir_para_o_lado(delta):
	position.x += side_speed
	
func encolher():
	scale *= TAXA_DE_ENCOLHIMENTO
	
func rodar(delta):
	if direction:
		rotation += ROTATION_SPEED * delta
	else:
		rotation += ROTATION_SPEED * delta * -1
		
func check_max_y():
	if ! subindo and position.y > start_y:
		queue_free()

func _on_Button_button_down():	
	die()
	
func die():
	mostra_cacos()
	queue_free()
	
func mostra_cacos():
	var cacos = PRE_CACOS.instance()
	get_parent().add_child(cacos)
	cacos.position = position
