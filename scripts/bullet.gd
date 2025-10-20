extends Area2D

var SPEED = 1000
var damage = 1

func _physics_process(delta: float):
	position += transform.x * SPEED * delta

## Коллизия пули
func _on_bullet_body_entered(body: Node2D) -> void:
	# Если пуля столкнулась с врагом: отнять хп у врага и исчезнуть
	if body is Enemy:
		body.take_damage(damage)
		queue_free()
	if body is TileMapLayer:
		queue_free()
