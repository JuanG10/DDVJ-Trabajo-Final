extends DrillState

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.FORWARD] = self

func enter_state(_param) -> void:
	pass

func physics_update(_delta: float) -> void:
	drill.drill_particles.emitting = true

func exit_state() -> void:
	drill.drill_particles.emitting = false
