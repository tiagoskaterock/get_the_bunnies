extends Node2D

const PRE_COELHO = preload("res://scenes/Coelho.tscn")
var points: int = 0
	
func _ready() -> void:
	update_label_points()
	$TimerRespawnCoelho.start()
	
func _on_TimerRespawnCoelho_timeout() -> void:
	var coelho = PRE_COELHO.instance()
	add_child(coelho)
	
func toca_som_de_caco() -> void:
	$Caco.play()
	
func set_points(new_points) -> void:
	self.points = new_points
	
func get_points() -> int:
	return self.points
	
func add_point() -> void:
	set_points(get_points() + 1)
	update_label_points()

func update_label_points() -> void:
	$LabelPontos.text = str(get_points())
