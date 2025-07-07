extends PlayerState

const ACCELERATION: float = 100
var jump_velocity: Vector2 # Para rebotar

func physics_update(_delta: float) -> void:
	var direction: float = Input.get_axis("left","right")

	if not player.is_on_floor():
		state_machine.change_to_state(state_machine.STATES.FALLING)
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_to_state(state_machine.STATES.JUMPING)
	elif direction == 0: # Ninguna tecla presionada
		if player.velocity.x == 0:
			# El personaje no tiene velocidad
			state_machine.change_to_state(state_machine.STATES.IDLE)
		elif abs(player.velocity.x) > 0:
			# Si se está moviendo, frenar en seco
			player.velocity.x = 0
	else:
		player.velocity.x += ACCELERATION * direction

	_limit_speed(direction)

func _limit_speed(direction: float) -> void:
	# Impide que supere el limite de velocidad horizontal al correr
	if abs(player.velocity.x) > ACCELERATION:
		player.velocity.x = ACCELERATION * direction
