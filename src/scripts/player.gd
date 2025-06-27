extends CharacterBody2D

const ACCELERATION := Vector2(300, 500) # x, y

func _physics_process(delta: float) -> void:
	var direction: float = Input.get_axis("izquierda", "derecha")

	if direction == 0: # Ninguna tecla presionada; frenar
		velocity.x = 0

	velocity.x += ACCELERATION.x * direction * delta
	velocity += get_gravity() * delta

	if velocity > ACCELERATION: # Impide que supere el limite de velocidad
		velocity = ACCELERATION

	move_and_slide()
