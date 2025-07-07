extends PlayerState

var collision_position # Vector2 para este estado
const BOUNCE_FORCE: float = 50 # Convertir a var en el futuro

func enter_state(new_collision_position) -> void:
	if new_collision_position: # Objeto de colision al comenzar el salto
		collision_position = new_collision_position
		player.velocity = Vector2()

func physics_update(_delta: float) -> void:
	var bounce_velocity = player.global_position - collision_position
	player.velocity += bounce_velocity.normalized() * BOUNCE_FORCE

	if not player.is_drilling:
		const IS_BOUNCING := true
		state_machine.change_to_state(state_machine.STATES.JUMPING,
		IS_BOUNCING)
