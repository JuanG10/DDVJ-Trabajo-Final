class_name StateMachine extends Node

@onready var player: Player = self.owner

enum STATES {
	IDLE,
	JUMPING,
	FALLING,
	RUNNING,
	DRILLING
}

var state_nodes: Dictionary[STATES, PlayerState]
var current_state: PlayerState:
	get: return current_state

func _ready() -> void:
	for state: PlayerState in get_children():
		state.initialize_state(self)
	current_state = state_nodes[STATES.IDLE]

func change_to_state(new_state: STATES, param: Variant = null) -> void:
	current_state = state_nodes[new_state]
	current_state.enter_state(param)
