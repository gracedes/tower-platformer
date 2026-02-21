extends CharacterBody3D

@export var JUMP_COEFF: float = 15.0
@export var GRAVITY: float = -0.5
@export var GLIDE_GRAVITY: float = -1.0

@export var jumps: int = 0
# var max_jumps: int = 2

func _physics_process(_delta: float) -> void:
	if not check_jump():
		if not check_glide():
			if is_on_floor():
				if jumps != 1:
					jumps = 1
				velocity.y = 0
			else:
				velocity.y += GRAVITY
	move_and_slide()
	
func check_jump() -> bool:
	if Input.is_action_just_pressed("jump") and jumps > 0:
		velocity.y = JUMP_COEFF
		jumps -= 1
		return true
	return false

func check_glide() -> bool:
	if Input.is_action_pressed("jump") and velocity.y < 0:
		velocity.y = GLIDE_GRAVITY
		return true
	return false

func add_jump() -> void:
	jumps += 1
	
