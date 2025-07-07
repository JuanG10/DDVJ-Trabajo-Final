extends PlayerState

@export var JUMP_ACCELERATION: float = 600
@export var JUMP_HEIGHT_LIMIT: float = -40

var initial_position: Vector2 # Posicion inicial al comenzar el salto
var bouncing: bool

func enter_state(bouncing_from_drilling) -> void:
	initial_position = player.position
	if is_instance_valid(bouncing_from_drilling):
		bouncing = bouncing_from_drilling

func physics_update(delta: float) -> void:
	if player.is_on_ceiling() or (
		player.position.y <= initial_position.y
		+ JUMP_HEIGHT_LIMIT):
		state_machine.change_to_state(state_machine.STATES.FALLING)
	_jump(delta)

func _jump(delta: float) -> void:
	if not bouncing:
		player.velocity.y -= JUMP_ACCELERATION * delta
