extends CharacterBody2D

@export var speed := 200
@export var jump_force := -400
@export var gravity := 20
@export var run_anim_count := 3
@export var jump_anim_count := 3
@export var run_anim_speed := 0.1  # seconds per frame

var sprite: AnimatedSprite2D
var run_index := 1
var run_timer := 0.0
var fixed_x := 300  # horizontal position to keep the player at

func _ready():
	sprite = $AnimatedSprite2D
	sprite.play("run1")
	position.x = fixed_x

func _physics_process(delta):
	# Auto-run logic (kept for collisions if needed)
	velocity.x = speed

	# Jump input
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_force
		_play_jump_animation()  # call the function below

	# Apply gravity
	velocity.y += gravity

	# Move the player
	move_and_slide()

	# Keep the player horizontally fixed
	position.x = fixed_x

	# Animation handling
	if is_on_floor():
		_cycle_run_animation(delta)

# Smoothly cycle running animations
func _cycle_run_animation(delta):
	run_timer += delta
	if run_timer >= run_anim_speed:
		run_timer = 0
		run_index += 1
		if run_index > run_anim_count:
			run_index = 1
		sprite.play("run" + str(run_index))

# Play a random jump animation
func _play_jump_animation():
	var jump_anim = "jump" + str(randi() % jump_anim_count + 1)
	sprite.play(jump_anim)
