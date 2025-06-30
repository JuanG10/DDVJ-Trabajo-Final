class_name Drill extends Node2D

@onready var animation := $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())

func start_drill(delta: float) -> void:
	animation.play("default")
