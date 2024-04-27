extends Node2D

var dir
var gravity = 200

func _ready():
	randomize()
	dir = randi() % 2 == 0
	if dir:
		rotate(90)
	else:
		rotate(-90)
	$AnimationPlayer.play("explode")
	
func _process(delta):
	position.y += gravity * delta
	print(position.y)
	
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
