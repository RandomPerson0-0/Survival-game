extends CharacterBody2D

var sprint = 600.0
var orginal_speed = 300.0
@export var speed: float = 300.0
@export var jump_velocity: float = -150.0
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D


var screen_size

signal player_speed_change
signal player_speed

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_lock: bool = false
var direction: Vector2 = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	set_meta("Player", 1)	


func _on_player_speed():
	#if the energy hits 0, it will activate this function, making the player 
	#unmovable
	speed = 0
	jump_velocity = 0
	sprint = 0
	orginal_speed = 0
	print("player stops")


func _on_player_speed_change():
	#if the energy gains at a certain level, the player can move again which 
	#then this function activate
	speed = 300
	jump_velocity = -300
	sprint = 600
	orginal_speed = 300
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
	
	# Get the input direction and handle the movement/deceleration
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	#if the player press the sprint key, the player speed will increase and if 
	#they release it, the speed will return to normal
	if Input.is_action_pressed("sprint"):
		speed = sprint
	elif Input.is_action_just_released("sprint"):
		speed = orginal_speed
	
	#if the player is out of bounds, then the game ends
	if position.y > 2000 and -2000:
		get_tree().change_scene_to_file("res://End.tscn")
	
	move_and_slide()
	_update_animation()
	_update_facing_animation()


func  _update_animation():
	#if the user press the left and right key, the animation will switch to walking
	#but other than that, it will stay in idle 
	if not animation_lock:
		if direction != Vector2.ZERO:
			animated_sprite.play("Walking")
		else:
			animated_sprite.play("Idle")


func _update_facing_animation():
	#if the player press the left or right key, the plpayer will face that way
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
