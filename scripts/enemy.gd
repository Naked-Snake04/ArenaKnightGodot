extends RigidBody2D

const SPEED = 400.0
#const JUMP_VELOCITY = -500.0
var hp = 4

## Нанесение урона для врага
func take_damage(damage):
	hp -= damage
	if hp < 1:
		queue_free()
