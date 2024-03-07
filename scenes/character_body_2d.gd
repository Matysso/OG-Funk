extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400.0
const VERTICAL_SPEED = 250.0
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	if (velocity.x < -1 and velocity.x < 0):
		sprite_2d.animation = "left"
	elif (velocity.x == 0 and velocity.y==0):
		sprite_2d.animation ="default"
	elif velocity.x>0  : 
		sprite_2d.animation = "right"
		
	# Gérer l'animation en fonction des mouvements verticaux
	elif velocity.y < 0 and velocity.x == 0:
		sprite_2d.animation = "up"
	elif velocity.y > 0 and velocity.x == 0:
		sprite_2d.animation = "down"
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction = Input.get_axis("left", "right")
	var vertical_direction = Input.get_axis("up", "down")
	if horizontal_direction:
		velocity.x = horizontal_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)
	if vertical_direction:
		velocity.y = vertical_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, 100)
	move_and_slide()


