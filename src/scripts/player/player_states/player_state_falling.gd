extends PlayerState

@export var FALLING_SPEED_LIMIT: float = 180
@export var FLOATING_TIME: float = 0.15
@onready var timer : Timer = $floating_time_timer

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.FALLING] = self

func enter_state(_param) -> void:
	timer.start(FLOATING_TIME)

func physics_update(_delta: float) -> void:
	_check_landing()

	if timer.is_stopped(): # Caer normal
		player.velocity += player.get_gravity()
	else: # Mantener velocidad horizontal / flotar un poco
		player.velocity = Vector2(player.velocity.x, 0)

	_limit_y_speed()

func _check_landing() -> void:
	if player.is_on_floor():
		if abs(player.velocity.x) > 0: # Tiene velocidad
			state_machine.change_to_state(state_machine.STATES.RUNNING)
		else:
			state_machine.change_to_state(state_machine.STATES.IDLE)

func _limit_y_speed() -> void:
	# Impide que supere el limite de velocidad vertical
	if abs(player.velocity.y) >= FALLING_SPEED_LIMIT:
		player.velocity.y = FALLING_SPEED_LIMIT
