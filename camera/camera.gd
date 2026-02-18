extends Camera3D

@onready var player = get_node("../Player")
@export var SPEED = 5.0

func _process(delta: float) -> void:
	position.y = move_toward(position.y, player.position.y, SPEED)
