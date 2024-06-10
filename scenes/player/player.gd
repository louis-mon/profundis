extends CharacterBody2D


func set_velocity_from_input(delta: float):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var vel = direction.normalized() * Constants.player_speed
	velocity = vel
	
func _process(delta):
	pass

func _physics_process(delta):
	set_velocity_from_input(delta)

	move_and_slide()
