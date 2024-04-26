extends Node2D

var start_y
var side_speed
var speed = 1500
var subindo = true
const GRAVITY = 30

func _ready():
	$AnimationPlayer.play("default")
	randomize()
	side_speed = get_random_side_speed()
	start_y = get_random_start_y()
	position.y = start_y
	position.x = get_random_start_x()
	print(position.x)

func _process(delta):
	subir_e_descer(delta)
	ir_para_o_lado(delta)
	check_max_y()
	
func get_random_start_x():
	return randi() % (int(get_viewport_rect().size.x) - 100) + 50
	
func get_random_side_speed():
	return (randi() % 6) - 3
	
func get_random_start_y():
	var random_number = (randi() % 300) + 50
	return get_viewport_rect().size.y + random_number

func subir_e_descer(delta):
	speed -= GRAVITY
	position.y -= speed * delta
	if speed < 0:
		subindo = false
		
func ir_para_o_lado(delta):
	position.x += side_speed

func check_max_y():
	if ! subindo and position.y > start_y:
		queue_free()

func _on_Button_button_down():
	die()
	
func die():
	queue_free()
