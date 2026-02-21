extends CharacterBody3D

@export var JUMP_COEFF: float = 15.0
@export var GRAVITY: float = -0.5
@export var GLIDE_GRAVITY: float = -1.0

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_COEFF
	elif is_on_floor():
		velocity.y = 0
	else: check_glide()
	
	move_and_slide()

func check_glide() -> void:
	if Input.is_action_pressed("jump") and velocity.y < 0:
		velocity.y = GLIDE_GRAVITY
	else:
		velocity.y += GRAVITY
