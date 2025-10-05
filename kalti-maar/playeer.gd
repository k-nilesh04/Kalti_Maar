extends CharacterBody2D

@export var speed := 200
@export var jump_force := -400

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	velocity.x = direction.x * speed

	if is_on_floor() and Input.is_action_just_pressed("ui_accept"): # spacebar
		velocity.y = jump_force

	velocity.y += 20 # gravity
	move_and_slide()
