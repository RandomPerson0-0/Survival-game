extends CharacterBody2D

signal player_speed_change
signal player_speed
@export var speed : float = 300.0
@export var jump_velocity : float = -250.0
var sprint = 600.0
var screen_size

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	screen_size = get_viewport_rect().size
	set_meta("Player", 1)	
	

func _on_player_speed():
	speed = 0
	jump_velocity = 0
	sprint = 0
	print("player stops")


func _on_player_speed_change():
	speed = 300
	jump_velocity = -300
	sprint = 600
	print("speed return")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	else:
		pass
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	if Input.is_action_pressed("sprint"):
		speed = sprint
	elif Input.is_action_just_released("sprint"):
		speed = 300.0
	else:
		pass
	
	move_and_slide()
	
	if position.y > 2000 and -2000:
		get_tree().change_scene_to_file("res://End.tscn")

	if speed == 0:
		if Input.is_action_pressed("sprint"):
			sprint == 0
		elif Input.is_action_pressed("left") and Input.is_action_pressed("right"):
			speed == 0
		elif Input.is_action_pressed("jump"):
			jump_velocity == 0
