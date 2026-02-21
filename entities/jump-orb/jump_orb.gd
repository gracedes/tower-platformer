extends Area3D

# TODO: make orb respawn on timer (or ground touch)

@onready var collision = get_node("CollisionShape3D")
@onready var mesh = get_node("MeshInstance3D")

func _on_body_entered(body: Node) -> void:
	if not (body is CharacterBody3D):
		push_error("Bug: body is not CharacterBody3D.")

	var player: CharacterBody3D = body
	if not player:
		return
	collision.disabled = true
	mesh.visible = false
	player.add_jump()
	# queue_free()

func respawn() -> void:
	collision.disabled = false
	mesh.visible = true
