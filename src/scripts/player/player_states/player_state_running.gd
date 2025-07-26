extends PlayerState

@export var ACCELERATION: float = 60
@export var SPEED_LIMIT: float = 110

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.RUNNING] = self

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
			# Si se está moviendo, frenar
			player.velocity.x = move_toward(
				player.velocity.x, 0, ACCELERATION)
	else:
		_move_player(direction)

func _move_player(direction: float) -> void:
	player.velocity.x += ACCELERATION * direction
	player.player_sprite.flip_h = direction <= 0
	_limit_speed(direction)

func _limit_speed(direction: float) -> void:
	if abs(player.velocity.x) > SPEED_LIMIT:
		player.velocity.x = SPEED_LIMIT * direction
