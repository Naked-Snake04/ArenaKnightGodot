extends Node2D

var bullet_scene = preload("res://Bullet/bullet.tscn")
var _player_position := Vector2.ZERO
@onready var s_gun: Sprite2D = $sGun

func _ready() -> void:
	Signals.player_position.connect(set_player_position)

func set_player_position(player_position: Vector2):
	_player_position = player_position

## Оружие смотрит в сторону мышки
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	## Переворачиваем спрайт оружия, если позиция мышки находится "за игроком"
	if get_global_mouse_position().x < _player_position.x:
		s_gun.flip_v = true
	else:
		s_gun.flip_v = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action("shoot") && event.is_pressed():
			var bullet = bullet_scene.instantiate()
			bullet.global_transform = $Muzzle.global_transform
			get_tree().get_root().add_child(bullet)
