extends PlayerState

@export var JUMP_ACCELERATION: float = -180
@export var JUMP_HEIGHT_LIMIT: float = -50
@export var BOUNCE_FORCE: float = 150

var initial_position: Vector2 # Posicion inicial al comenzar el salto
var bouncing_from_position: Vector2 # Posicion de objecto del que se rebota

func _add_state_to_machine() -> void:
	state_machine.state_nodes[state_machine.STATES.JUMPING] = self

func enter_state(bounce_object_position) -> void:
	initial_position = player.position
	if bounce_object_position:
		bouncing_from_position = bounce_object_position

func physics_update(_delta: float) -> void:
	if player.is_on_ceiling() or (player.position.y <= 
	initial_position.y + JUMP_HEIGHT_LIMIT):
		state_machine.change_to_state(
			state_machine.STATES.FALLING)

	if bouncing_from_position: # Rebote
		player.velocity = (
			player.global_position - bouncing_from_position
			).normalized() * BOUNCE_FORCE
		bouncing_from_position = Vector2()
	else: # Salto normal
		player.velocity.y = JUMP_ACCELERATION
