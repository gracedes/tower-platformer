extends Camera3D

# TODO: camera movement

@onready var player: CharacterBody3D = get_node("../Player")
@export var SPEED: float = 0.01

func _process(_delta: float) -> void:
	position.y = move_toward(position.y, player.position.y + 2.0, SPEED)
			
# TODO: camera movement
