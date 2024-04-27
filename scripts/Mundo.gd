extends Node2D

const PRE_COELHO = preload("res://scenes/Coelho.tscn")
	
func _ready():
	$TimerRespawnCoelho.start()
	
func _on_TimerRespawnCoelho_timeout():
	var coelho = PRE_COELHO.instance()
	add_child(coelho)
	
func toca_som_de_caco():
	$Caco.play()
