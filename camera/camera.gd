extends Camera3D

@onready var player: CharacterBody3D = get_node("../Player")
@export var SPEED: float = 5.0

func _process(_delta: float) -> void:
	position.y = move_toward(position.y, player.position.y, SPEED)
