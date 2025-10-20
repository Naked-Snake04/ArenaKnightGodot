extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().reload_current_scene.call_deferred()
	if body is Enemy:
		body.queue_free()
