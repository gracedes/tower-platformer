extends Area3D

@onready var collision = get_node("CollisionShape3D")
@onready var mesh = get_node("MeshInstance3D")

@export var spin_speed: float = 2.5

func _on_body_entered(body: Node) -> void:
	if not (body is CharacterBody3D):
		push_error("Bug: body is not CharacterBody3D.")

	var player: CharacterBody3D = body
	if not player:
		return
	collision.disabled = true
	mesh.visible = false
	player.end_game()

func _physics_process(delta: float) -> void:
	rotation.y += spin_speed * delta
