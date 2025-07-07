extends PlayerState

const FALLING_SPEED_LIMIT: float = 150
const FLOATING_TIME: float = 0.15
var timer : Timer

func enter_state(_param) -> void:
	_config_and_start_timer()

func physics_update(delta: float) -> void:
	_check_landing()

	if timer.is_stopped(): # Caer normal
		player.velocity += player.get_gravity() * delta
	else: # Mantener velocidad horizontal / flotar un poco
		player.velocity = Vector2(player.velocity.x, 0)

	_limit_y_speed()

func _config_and_start_timer() -> void:
	timer = Timer.new()
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start(FLOATING_TIME)

func _check_landing() -> void:
	if player.is_on_floor():
		timer.queue_free()
		if abs(player.velocity.x) > 0: # Tiene velocidad
			state_machine.change_to_state(state_machine.STATES.RUNNING)
		else:
			state_machine.change_to_state(state_machine.STATES.IDLE)

func _limit_y_speed() -> void:
	# Impide que supere el limite de velocidad vertical
	if abs(player.velocity.y) >= FALLING_SPEED_LIMIT:
		player.velocity.y = FALLING_SPEED_LIMIT

func _on_timer_timeout() -> void:
	pass
