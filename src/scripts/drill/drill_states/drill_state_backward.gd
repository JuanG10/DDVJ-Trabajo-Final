extends DrillState

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.BACKWARD] = self

func enter_state(_param) -> void:
	drill.animation.play_backwards("default")

func physics_update(_delta: float) -> void:
	pass

func exit_state() -> void:
	pass
