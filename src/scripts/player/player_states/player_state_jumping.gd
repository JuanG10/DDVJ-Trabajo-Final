extends PlayerState

const JUMP_ACCELERATION: float = 500
const JUMP_LIMIT: float = -100

func physics_update(delta: float) -> void:
	if player.is_on_ceiling() or player.velocity.y <= JUMP_LIMIT:
		state_machine.change_to_state(state_machine.STATES.FALLING)

	player.velocity.y -= JUMP_ACCELERATION * delta
