extends Area3D

# TODO: make orb respawn on timer (or ground touch)

func _on_body_entered(body: Node) -> void:
	if not (body is CharacterBody3D):
		push_error("Bug: body is not CharacterBody3D.")

	var player: CharacterBody3D = body
	if not player:
		return
	player.add_jump()
	# queue_free()
