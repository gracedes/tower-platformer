extends RigidBody3D

# TODO: add acceleration maybe?

@export var ROTATE_SPEED: float = 10.0		# change to const later

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		angular_velocity.y = ROTATE_SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		angular_velocity.y = -ROTATE_SPEED
	else:
		angular_velocity.y = 0.0
