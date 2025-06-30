class_name PlayerState extends Node

var state_machine: StateMachine
var player: Player

func initialize_state(new_state_machine: StateMachine) -> void:
	state_machine = new_state_machine
	player = state_machine.player

func enter_state() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
