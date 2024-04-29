extends Node2D

const PRE_COELHO = preload("res://scenes/Coelho.tscn")
var _points: int = 0
var _pontos_por_coelho: int = 10
	
func _ready() -> void:
	update_label_points()
	$TimerRespawnCoelho.start()
	$BackgroundMusic_001.play()
	
func _on_TimerRespawnCoelho_timeout() -> void:
	var coelho = PRE_COELHO.instance()
	add_child(coelho)
	
func toca_som_de_caco() -> void:
	$Caco.play()
	
func set_points(new_points) -> void:
	_points = new_points
	
func get_points() -> int:
	return _points
	
func add_point() -> void:
	set_points(get_points() + get_pontos_por_coelho())
	update_label_points()

func update_label_points() -> void:
	$LabelPontos.text = str(get_points())
	
func get_pontos_por_coelho() -> int:
	return _pontos_por_coelho
	
func toca_som_de_grito() -> void:
	$Scream.play()
