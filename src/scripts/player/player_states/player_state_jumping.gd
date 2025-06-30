extends PlayerState

const JUMP_ACCELERATION: float = 600
const JUMP_ACCELERATION_LIMIT: float = -200
var collision_position: Variant # Debería ser un Vector2

func enter_state(new_collision_position) -> void:
	if new_collision_position:
		collision_position = new_collision_position

func physics_update(delta: float) -> void:
	if collision_position:
		player.velocity -= collision_position * delta
		collision_position = null
	elif player.is_on_ceiling() or player.velocity.y <= JUMP_ACCELERATION_LIMIT:
		state_machine.change_to_state(state_machine.STATES.FALLING)

	_jump(delta)

func _jump(delta: float) -> void:
	player.velocity.y -= JUMP_ACCELERATION * delta
