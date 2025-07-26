extends PlayerState

var collision_position # Vector2 para este estado

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.DRILLING] = self

func enter_state(new_collision_position) -> void:
	if new_collision_position: # Objeto de colision al comenzar el salto
		collision_position = new_collision_position
		player.velocity = Vector2()

func physics_update(_delta: float) -> void:
	if not player.drill.is_drilling:
		state_machine.change_to_state(state_machine.STATES.JUMPING,
		collision_position)
