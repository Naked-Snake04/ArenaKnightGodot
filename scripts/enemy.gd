extends CharacterBody2D

class_name Enemy

const SPEED = 400
var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

var hp = 4

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	
	velocity.x = direction * SPEED
	
	if direction < 0:
		$sEnemy.flip_h = true
	elif direction:
		$sEnemy.flip_h = false
	
	move_and_slide()

## Нанесение урона для врага
func take_damage(damage):
	hp -= damage
	if hp < 1:
		Signals.enemy_dead.emit()
		queue_free()
