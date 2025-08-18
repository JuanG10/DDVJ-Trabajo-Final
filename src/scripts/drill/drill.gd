class_name Drill extends Node2D

@onready var drill_state_machine: DrillStateMachine = $drill_state_machine
@onready var animation := $AnimatedSprite2D
@onready var drill_particles: GPUParticles2D = $drill_particles_demo

func _physics_process(delta: float) -> void:
	_effects()
	drill_state_machine.current_state.physics_update(delta)

func _effects() -> void:
	if Input.is_action_pressed("drill_forward"):
		animation.play("default")
