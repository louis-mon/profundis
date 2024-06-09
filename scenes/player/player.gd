extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -400.0


func set_velocity_from_input(delta: float):
	var x_val = Input.get_axis("move_left", "move_right")
	var y_val = Input.get_axis("move_up", "move_down")
	var vel = Vector2(x_val, y_val).normalized() * SPEED
	velocity = vel
	
func _process(delta):
	get_parent().get_node("FoodDetection").position = position
	get_parent().get_node("Mouth").position = position
	

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	set_velocity_from_input(delta)

	move_and_slide()
