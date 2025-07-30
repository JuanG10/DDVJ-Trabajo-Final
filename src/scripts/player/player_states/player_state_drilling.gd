extends PlayerState

var collision_position # Vector2 para este estado
var player_velocity_on_enter: Vector2
var rand := RandomNumberGenerator.new()
var drill: Drill

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.DRILLING] = self

func enter_state(new_collision_position) -> void:
	collision_position = new_collision_position # Coord. de colision
	drill = player.drill
	player_velocity_on_enter = player.velocity
	player.velocity = Vector2()

func physics_update(_delta: float) -> void:
	var drilling: bool = drill.is_drilling_forward or drill.is_drilling_backward
	_effects(drilling)

	if drill.bounce_from_drilling():
		state_machine.change_to_state(state_machine.STATES.JUMPING,
		collision_position)
	elif drilling:
		return
	else:
		state_machine.change_to_state(state_machine.STATES.IDLE)

func _effects(is_drilling: bool) -> void:
	var random_vector = Vector2(
		rand.randf_range(-1,1), rand.randf_range(-1,1))
	
	if is_drilling:
		player.player_sprite.offset = random_vector
		player.player_camera.offset = random_vector
		drill.drill_particles.emitting = true
	else:
		drill.drill_particles.emitting = false
		player.player_sprite.offset = Vector2()
		player.player_camera.offset = Vector2()
