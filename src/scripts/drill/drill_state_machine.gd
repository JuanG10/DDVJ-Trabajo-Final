class_name DrillStateMachine extends Node

@onready var drill: Drill = $"../drill"

enum STATES {
	IDLE,
	FORWARD,
	BACKWARD
}

var state_nodes: Dictionary[STATES, DrillState]
var current_state: DrillState:
	get: return current_state

func _ready() -> void:
	for state: DrillState in get_children():
		state.initialize_state(self)
	current_state = state_nodes[STATES.IDLE]

func change_to_state(new_state: STATES, param: Variant = null) -> void:
	if current_state:
		current_state.exit_state()
	current_state = state_nodes[new_state]
	current_state.enter_state(param)
