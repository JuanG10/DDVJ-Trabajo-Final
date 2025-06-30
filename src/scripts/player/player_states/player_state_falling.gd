extends PlayerState

const FALLING_SPEED_LIMIT: float = 300

func enter_state() -> void:
	print("Entró a FALLING")

func physics_update(delta: float) -> void:
	if player.is_on_floor():
		if abs(player.velocity.x) > 0:
			state_machine.change_to_state(state_machine.STATES.RUNNING)
		else:
			state_machine.change_to_state(state_machine.STATES.IDLE)

	player.velocity += player.get_gravity() * delta
	_limit_speed()

func _limit_speed() -> void:
	# Impide que supere el limite de velocidad de caida
	if player.velocity.y >= FALLING_SPEED_LIMIT:
		player.velocity.y = FALLING_SPEED_LIMIT
