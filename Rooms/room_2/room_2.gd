extends Node2D

var enemy_dead_count := 0

const ROOM_3 = "res://Rooms/room_3/room_3.tscn"

func _ready() -> void:
	enemy_dead_count = get_tree().get_node_count_in_group("Enemies")
	Signals.enemy_dead.connect(_on_enemy_dead) # Получаем сигнал, если противник помер
	
func _on_enemy_dead():
	enemy_dead_count -= 1
	if enemy_dead_count == 0:
		# Переходим в следующую сцену
		get_tree().change_scene_to_file(ROOM_3)
