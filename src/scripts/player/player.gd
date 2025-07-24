class_name Player extends CharacterBody2D

@onready var player_state_machine : StateMachine = $player_state_machine
@onready var drill: Drill = $drill

@onready var debug_label: Label = $Debug_label

func _ready() -> void:
	drill.set_up_drill(player_state_machine)

func _physics_process(delta: float) -> void:
	debug_label.text = player_state_machine.current_state.name # Debug
	drill.handle_drill() # Mal implementado; Se ejecuta muchas veces
	if not Input.is_action_pressed("shift"):
		# Condicional temporal/debug;
		# El jugador debe mantener movimiento al presionar shift
		player_state_machine.current_state.physics_update(delta)
		move_and_slide()
