extends PlayerState

const JUMP_ACCELERATION: float = 600
const JUMP_HEIGHT_LIMIT: float = -50

var initial_position: Vector2 # Posicion inicial al comenzar el salto

func enter_state(new_collision_position) -> void:
	initial_position = player.position

func physics_update(delta: float) -> void:
	if player.is_on_ceiling() or (
		player.position.y <= initial_position.y
		+ JUMP_HEIGHT_LIMIT):
		state_machine.change_to_state(state_machine.STATES.FALLING)
	_jump(delta)

func _jump(delta: float) -> void:
	player.velocity.y -= JUMP_ACCELERATION * delta
