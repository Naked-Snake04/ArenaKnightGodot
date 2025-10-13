extends Node2D

var bullet_scene = preload("res://enemy_bullet/enemy_bullet.tscn")
@onready var timer: Timer = $Timer
var _position_player := Vector2.ZERO
@export var shoot_cooldown:= 400

## Оружие противника смотрит на игрока
func _ready() -> void:
	Signals.player_position.connect(_on_player_position)

func _on_player_position(player_position: Vector2):
	_position_player = player_position
	look_at(player_position) # Делаем так, чтобы камера смотрела на игрока

func _process(delta: float) -> void:
	var distance = _position_player.distance_to(global_position) # Вычисляем дистанцию от игрока
	if (distance < shoot_cooldown):
		if timer.is_stopped():
			timer.start()
	else:
		timer.stop()

func _on_timer_timeout() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.global_transform = $Muzzle.global_transform
	get_tree().get_root().add_child(bullet)
