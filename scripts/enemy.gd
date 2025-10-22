extends CharacterBody2D

class_name Enemy

const SPEED = 400
var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_floor: RayCast2D = $RayCastFloor

@export var hp = 4

func _ready() -> void:
	## Добавляем в группу врагов, для подсчёта их на уровне
	add_to_group("Enemies")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	
	if !ray_cast_floor.is_colliding() and is_on_floor():
		direction = -direction
	
	velocity.x = direction * SPEED
	
	if direction < 0:
		$sEnemy.flip_h = true
	elif direction >= 0:
		$sEnemy.flip_h = false
	
	move_and_slide()

## Нанесение урона для врага
func take_damage(damage):
	hp -= damage
	if hp < 1:
		Signals.enemy_dead.emit()
		queue_free()
