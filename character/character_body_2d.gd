extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -800.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

		
		
		
	if (velocity.x < -1 and velocity.x < 0 and is_on_floor()):
		sprite_2d.animation = "left"
	elif (velocity.x == 0 and is_on_floor()):
		sprite_2d.animation ="default"
	elif velocity.x>0 and is_on_floor(): 
		sprite_2d.animation = "right"
	elif not is_on_floor() and velocity.x>0 or velocity.x==0:
		sprite_2d.animation = "jump"
	elif not is_on_floor() and velocity.x < -1 and velocity.x < 0 :
		sprite_2d.animation = "jump2"
	 
	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction = Input.get_axis("left", "right")
	
	if horizontal_direction:
		velocity.x = horizontal_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)

		
		

	move_and_slide()


