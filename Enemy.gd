extends Area2D

@export var upgrade_speed: float = 200.0
@export var speed: float = 200.0
var stop = 0

signal enemy

func _ready():
	enemy.connect(get_node("/root/Main/UI/Status")._on_enemy_body_shape_entered)


func _physics_process(delta):
	look_at(get_node("/root/Main/Player").position)
	move_local_x(speed * delta)


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#if the enemy touches the player, it will signal the status which then 
	#it will change the value of the players health
	#also, if the enemy touches the player, it will temporary stop the enemy 
	#from moving
	if body.has_meta("Player"):
		upgrade_speed += 10
		enemy.emit(body)
		speed = stop


#this function is a timer so when the enemy stops, it will be for 5 seconds which
#then the enemy will move again
func _on_timer_timeout():
	#also for every 5 seconds, the enemy speed will increase to make it 
	#challenging
	speed = upgrade_speed

