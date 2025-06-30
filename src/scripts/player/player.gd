class_name Player extends CharacterBody2D

@export var player_state_machine : StateMachine
@onready var drill: Drill = $drill

func _physics_process(delta: float) -> void:
	player_state_machine.current_state.physics_update(delta)
	_handle_drill(delta)
	move_and_slide()

func _handle_drill(delta: float) -> void:
	if Input.is_action_pressed("drill"):
		drill.start_drill(delta)
