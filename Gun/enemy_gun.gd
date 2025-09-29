extends Node2D

## Оружие противника смотрит на игрока
func _ready() -> void:
	Signals.player_position.connect(look_at)
