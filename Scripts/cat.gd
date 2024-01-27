extends CharacterBody2D


const speed = 300.0


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_pressed("wreck_button"):
		var collision_body = get_collider()
		if collision_body:
			if collision_body.has_method("wreck"):
				collision_body.wreck()
			


