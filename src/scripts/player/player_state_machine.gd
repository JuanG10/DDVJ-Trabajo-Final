class_name StateMachine extends Node

enum STATES {
	IDLE,
	JUMPING,
	FALLING,
	RUNNING,
	DRILLING
}

@onready var state_nodes := {
	STATES.IDLE: $idle,
	STATES.JUMPING: $jumping,
	STATES.FALLING: $falling,
	STATES.RUNNING: $running,
	STATES.DRILLING: $drilling
}
@export var player: Player
@export var initial_state: STATES
@onready var current_state: PlayerState = state_nodes[initial_state]:
	get: return current_state

func _ready() -> void:
	for node in state_nodes.values():
		node.initialize_state(self)

func change_to_state(new_state: STATES, param: Variant = null) -> void:
	current_state = state_nodes[new_state]
	current_state.enter_state(param)
