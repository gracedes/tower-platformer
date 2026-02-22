extends CharacterBody3D

@export var JUMP_COEFF: float = 15.0
@export var GRAVITY: float = -0.5
@export var GLIDE_GRAVITY: float = -2.5

@export var jumps: int = 0
var needs_reset: bool = false
var reset_time = 0.2
var reset_timer = 0.0

var end = false
var end_timer = 0.0
var end_time = 10.0

@onready var orbs: Array[Node] = get_node("../Stage/Orbs").get_children()
@onready var stage = get_node("../Stage")
@onready var cam = get_node("../Camera3D")
@onready var sprite = get_node("AnimatedSprite3D")
@onready var win_text = get_node("MeshInstance3D")

func _physics_process(_delta: float) -> void:
	sprite.flip_h = (stage.angular_velocity.y > 0)
	if end:
		end_timer += _delta
		if end_timer >= end_time: get_tree().reload_current_scene()
	if not check_jump():
		if not check_glide():
			if is_on_floor():
				if jumps != 1:
					jumps = 1
				if needs_reset:
					if reset_timer >= reset_time:
						reset_jumps()
					else: reset_timer += _delta
				velocity.y = 0
				if stage.angular_velocity.y != 0:
					sprite.play("run")
				else: sprite.play("jump")
			else:
				velocity.y += GRAVITY
	move_and_slide()
	
func check_jump() -> bool:
	if Input.is_action_just_pressed("jump") and jumps > 0:
		velocity.y = JUMP_COEFF
		jumps -= 1
		needs_reset = true
		sprite.play("jump")
		return true
	return false

func check_glide() -> bool:
	if Input.is_action_pressed("jump") and velocity.y < 0:
		velocity.y = GLIDE_GRAVITY
		rotation.z =  move_toward(rotation.z, sign(stage.angular_velocity.y) * 0.5, 0.05)
		sprite.play("glide")
		return true
	rotation.z = 0.0
	return false

func add_jump() -> void:
	jumps += 1
	needs_reset = true
	
func reset_jumps() -> void:
	for orb: Node in orbs:
		orb.respawn()
	reset_timer = 0.0
	needs_reset = false
	
func end_game() -> void:
	win_text.visible = true
	end = true
	
