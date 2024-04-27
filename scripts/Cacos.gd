extends Node2D

var dir
var gravity = 50

func _ready():
	randomize()
	roda()
	$AnimationPlayer.play("explode")
	get_parent().toca_som_de_caco()
	
func _process(delta):
	position.y += gravity * delta
	
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	
func roda():
	dir = randi() % 2 == 0
	if dir:
		rotate(90)
	else:
		rotate(-90)
