extends Node2D

@export var scenes: Array[PackedScene]   
var rng := RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	$Timer.timeout.connect(_on_timer_timeout) 

func _on_timer_timeout():
	if scenes.is_empty():
		return

	
	var selected_index = rng.randi_range(0, scenes.size() - 1)
	var new_scene = scenes[selected_index].instantiate()

	
	add_child(new_scene)

	
	new_scene.position = position
