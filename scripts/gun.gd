extends Node2D

## Оружие смотрит в сторону мышки
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
