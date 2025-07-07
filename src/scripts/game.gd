extends Node

@onready var player: Player = $player

func _process(_delta: float) -> void:
	if (player.position.x >= get_window().size.x
	or player.position.x < 0
	or player.position.y < 0
	or player.position.y >= get_window().size.y
	): # Si se va del mapa
		get_tree().reload_current_scene()
