class_name DrillState extends Node

var state_machine: DrillStateMachine
var drill: Drill

signal drilling

func initialize_state(new_state_machine: DrillStateMachine) -> void:
	state_machine = new_state_machine
	drill = state_machine.drill
	_add_state_to_machine()

func _add_state_to_machine() -> void:
	# Subtarea para no modificar el initialize en cada estado
	pass

func enter_state(_param: Variant) -> void:
	drilling.emit()

func physics_update(_delta: float) -> void:
	pass

func exit_state() -> void:
	pass
