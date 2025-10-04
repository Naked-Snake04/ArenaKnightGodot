extends Node2D

var bullet_scene = preload("res://Bullet/bullet.tscn")

## Оружие смотрит в сторону мышки
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

	# Стрельба из оружия
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.global_transform = $Muzzle.global_transform
		get_tree().get_root().add_child(bullet)
