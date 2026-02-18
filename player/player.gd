extends CharacterBody3D

@export var JUMP_COEFF = 15.0
@export var GRAVITY = -0.5

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_COEFF
	elif is_on_floor():
		velocity.y = 0
	else:
		velocity.y += GRAVITY
	move_and_slide()
