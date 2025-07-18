class_name PlayerState extends Node

var state_machine: StateMachine
var player: Player

func initialize_state(new_state_machine: StateMachine) -> void:
	state_machine = new_state_machine
	player = state_machine.player
	_add_state_to_machine()

func _add_state_to_machine() -> void:
	# Subtarea para no modificar el initialize en cada estado
	pass

func enter_state(_param: Variant) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func exit_state() -> void:
	pass
