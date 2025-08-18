class_name Player extends CharacterBody2D

@onready var player_state_machine: PlayerStateMachine = $player_state_machine
@onready var drill: Drill = $drill
@onready var player_camera := $player_camera
@onready var player_sprite := $player_sprite:
	get: return player_sprite

@onready var debug_label := $Debug_label

func _physics_process(delta: float) -> void:
	debug_label.text = player_state_machine.current_state.name # Debug
	player_state_machine.current_state.physics_update(delta)
	move_and_slide()

func _on_drill_drilling() -> void:
	player_state_machine.change_to_state(player_state_machine.STATES.DRILLING)
