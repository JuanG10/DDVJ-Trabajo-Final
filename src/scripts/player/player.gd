class_name Player extends CharacterBody2D

@export var player_state_machine : StateMachine
@onready var drill: Drill = $drill

var is_drilling := false # Temporal, habría que usar estados

func _physics_process(delta: float) -> void:
	player_state_machine.current_state.physics_update(delta)
	_handle_drill()
	move_and_slide()

func _handle_drill() -> void:
	if Input.is_action_pressed("drill"):
		is_drilling = true
		drill.start_drill()
	if Input.is_action_just_released("drill"):
		is_drilling = false
		drill.stop_drill()

	if is_drilling and drill.is_collisioning:
		player_state_machine.change_to_state(
			player_state_machine.STATES.JUMPING, drill.collisioned_area_position)
