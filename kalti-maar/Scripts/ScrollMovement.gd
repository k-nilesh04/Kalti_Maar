extends Node2D

@export var scroll_speed: float = 200.0   # pixels per second
@export var cleanup_x: float = -200.0     # x position to delete node

func move(delta: float) -> void:
	position.x -= scroll_speed * delta

	# Auto cleanup when off screen
	if position.x < cleanup_x:
		queue_free()
