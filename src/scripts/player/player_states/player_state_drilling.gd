extends PlayerState

var _velocity_resetted := false
var collision_position: Variant # Debería ser un Vector2

func enter_state(new_collision_position) -> void:
	if new_collision_position: # Objeto de colision al comenzar el salto
		collision_position = new_collision_position

func physics_update(_delta: float) -> void:
	pass

#func _handle_bounce(delta: float) -> void:
	#_set_player_velocity()

	# REPROGRAMAR:
	# Si el jugador colisiona a izq/der ->
		# rebotar al lado opuesto (se reinicia su vel en x)
		# su posición vertical debería verse afectada por
		# hacia donde apunta el taladro

	# Si el jugador colisiona con algo debajo ->
		# mantener velocidad o simular inercia en x;
		# seguir saltando normal en y

	# IMPLEMENTACIÓN ANTERIOR
	#player.velocity -= (
		#player.global_position + collision_position
		#) * delta

#func _set_player_velocity() -> void:
	#if not _velocity_resetted:
		#player.velocity = Vector2(player.velocity.x,0)
		#_velocity_resetted = true
