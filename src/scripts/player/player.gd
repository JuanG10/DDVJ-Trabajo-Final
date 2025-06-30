class_name Player extends CharacterBody2D

@export var player_state_machine : StateMachine

func _physics_process(delta: float) -> void:
	player_state_machine.current_state.physics_update(delta)
	move_and_slide()
