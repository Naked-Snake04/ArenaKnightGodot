extends Node2D

var bullet_scene = preload("res://enemy_bullet/enemy_bullet.tscn")
@onready var timer: Timer = $Timer

## Оружие противника смотрит на игрока
func _ready() -> void:
	Signals.player_position.connect(create_bullet)

func create_bullet(player_position: Vector2):
	look_at(player_position) # Делаем так, чтобы камера смотрела на игрока
	
	var distance = player_position.distance_to(position) # Вычисляем дистанцию от игрока
	
	if (distance < 1000):
		if timer.is_stopped():
			timer.start()
	else:
		timer.stop()

func _on_timer_timeout() -> void:
		var bullet = bullet_scene.instantiate()
		bullet.global_transform = $Muzzle.global_transform
		get_tree().get_root().add_child(bullet)
