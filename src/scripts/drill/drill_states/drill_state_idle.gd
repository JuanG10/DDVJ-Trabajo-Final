extends DrillState

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.IDLE] = self

func physics_update(_delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "up", "down")
	drill.rotation = input_dir.angle()

	if Input.is_action_pressed("drill_forward") and drill.is_collisioning:
		state_machine.change_to_state(state_machine.STATES.FORWARD)
