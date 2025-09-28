extends Area2D

var SPEED = 750

func _physics_process(delta: float):
	position += transform.x * SPEED * delta
