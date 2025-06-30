class_name Drill extends Node2D

@onready var animation := $AnimatedSprite2D
var collisioned_area_position: Vector2

var is_collisioning := false

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())

func start_drill() -> void:
	animation.play("default")

func stop_drill() -> void:
	animation.stop()

func _on_drill_area_entered(area: Area2D) -> void:
	collisioned_area_position = area.global_position
	is_collisioning = true

func _on_drill_area_exited(_area: Area2D) -> void:
	collisioned_area_position = Vector2()
	is_collisioning = false
