extends PlayerState

var rand := RandomNumberGenerator.new()

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.DRILLING] = self

func enter_state(_param) -> void:
	pass

func physics_update(_delta: float) -> void:
	_effects()

func exit_state() -> void:
	player.player_sprite.offset = Vector2()
	player.player_camera.offset = Vector2()

func _effects() -> void:
	var random_vector = Vector2(
		rand.randf_range(-1,1), rand.randf_range(-1,1))
	player.player_sprite.offset = random_vector
	player.player_camera.offset = random_vector
