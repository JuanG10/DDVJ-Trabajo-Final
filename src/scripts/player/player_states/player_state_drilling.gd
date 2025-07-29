extends PlayerState

var collision_position # Vector2 para este estado
var rand := RandomNumberGenerator.new()

enum DRILL_STATES {
	FORWARD,
	BACKWARD
}

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.DRILLING] = self

func enter_state(new_collision_position) -> void:
	collision_position = new_collision_position # Coord. de colision
	player.velocity = Vector2()

func physics_update(_delta: float) -> void:
	var drilling: bool = player.drill.is_drilling_forward

	_shake_effects(drilling)

	if not drilling:
		state_machine.change_to_state(state_machine.STATES.JUMPING,
		collision_position)

func _shake_effects(is_drilling: bool) -> void:
	var random_vector = Vector2(
		rand.randf_range(-1,1), rand.randf_range(-1,1))
	
	if is_drilling:
		player.player_sprite.offset = random_vector
		player.player_camera.offset = random_vector
	else:
		player.drill.drill_particles.emitting = false
		player.player_sprite.offset = Vector2()
		player.player_camera.offset = Vector2()
