extends PlayerState

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.IDLE] = self

func enter_state(_param) -> void:
	state_machine.player.velocity = Vector2() # Jugador quieto

func physics_update(_delta: float) -> void:
	var direction: float = Input.get_axis("left","right")

	if not player.is_on_floor():
		state_machine.change_to_state(state_machine.STATES.FALLING)
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_to_state(state_machine.STATES.JUMPING)
	elif abs(direction) != 0:
		state_machine.change_to_state(state_machine.STATES.RUNNING)
