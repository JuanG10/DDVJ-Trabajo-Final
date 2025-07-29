class_name Drill extends Node2D

@onready var animation := $AnimatedSprite2D
@onready var drill_particles: GPUParticles2D = $drill_particles_demo

var collisioned_area_position: Vector2
var player_state_machine: StateMachine

var is_drilling_forward := false
var is_drilling_backward := false
var is_collisioning := false

func set_up_drill(new_player_state_machine: StateMachine) -> void:
	player_state_machine = new_player_state_machine

func _physics_process(_delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "up", "down")
	if not (is_drilling_forward and is_collisioning):
		rotation = input_dir.angle()

func handle_drill() -> void:
	if Input.is_action_just_pressed("drill_forward") and !is_drilling_backward:
		_start_drill_forward()

	if Input.is_action_just_pressed("drill_backward") and !is_drilling_forward:
		_start_drill_backward()

	if is_drilling_forward and is_collisioning:
		drill_particles.emitting = true
		print("Before DRILLING")
		player_state_machine.change_to_state(
			player_state_machine.STATES.DRILLING,
			self.collisioned_area_position)

	if Input.is_action_just_released("drill_forward") or Input.is_action_just_released("drill_backward"):
		_stop_drill()

func _start_drill_forward() -> void:
	is_drilling_forward = true
	animation.play("default")

func _start_drill_backward() -> void:
	is_drilling_backward = true
	animation.play_backwards("default")

func _stop_drill() -> void:
	is_drilling_forward = false
	is_drilling_backward = false
	animation.stop()

func _on_drill_area_entered(area: Area2D) -> void:
	collisioned_area_position = area.global_position
	is_collisioning = true

func _on_drill_area_exited(_area: Area2D) -> void:
	collisioned_area_position = Vector2()
	is_collisioning = false
