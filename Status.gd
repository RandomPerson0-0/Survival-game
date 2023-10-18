extends Control

signal energy_gain
signal out_of_energy
@export var current_health = 100
@export var current_hunger = 100
@export var current_thrist = 100
@export var current_energy = 100
var min = 0
var max = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	out_of_energy.connect(get_node("/root/Main/Player")._on_player_speed)
	energy_gain.connect(get_node("/root/Main/Player")._on_player_speed_change)

#when the timer hits the specific time, the values decreases	
func _on_timer_hunger():
	current_hunger -= 1
	$Hunger_bar.set_value(current_hunger)


func _on_timer_thirst():
	current_thrist -= 1
	$Thrist_bar.set_value(current_thrist)


func _on_timer_energy():
	current_energy -= 1
	if Input.is_action_pressed("sprint"):
		if current_energy > min:
			current_energy -= 10
	elif not Input.is_action_pressed("sprint"):
		if current_energy > min:
			current_energy -= 1
	else:
		pass
	$Energy_bar.set_value(current_energy)


func _on_timer_health():
	if current_hunger and current_thrist < min:
		current_health -= 5
	elif current_thrist < min:
		current_health-= 1
	elif current_hunger < min:
		current_health -= 1
	else:
		pass
	if current_health < min:
		get_tree().change_scene_to_file("res://End.tscn")
	else:
		pass
	if current_hunger and current_thrist == 100:
		current_health += 5
	$Health_bar.set_value(current_health)


#when the player touches the objects eg. food, water power_up and the enemy, 
#it changes the status value
func _on_water_body_entered(body):
	current_thrist += 5
	if current_thrist > max:
		current_thrist == 100
	$Thrist_bar.set_value(current_thrist)


func _on_food_body_entered(body):
	current_hunger += 5
	if current_hunger > max:
		current_hunger == 100
	$Hunger_bar.set_value(current_hunger)


func _on_power_up_body_entered(body):
	current_health += 10
	if current_health > max:
		current_health == 100
	$Health_bar.set_value(current_health)


func _on_enemy_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# when the enemy hits the player, the health bar loses values
	current_health -= 5
	if current_health > max:
		current_health == 100
	$Health_bar.set_value(current_health)


func _on_side_weapon_body_entered(body):
	# when the enemy hits the player, it decrease the player health
	current_health -= 1
	if current_health > max:
		current_health == 100
	$Health_bar.set_value(current_health)

#when the timer hits, the values will be gained back base on the condition
func _on_energy_gain_timeout():
	if not Input.is_action_pressed("energy"):
			current_energy += 1
	if current_energy < min:
		out_of_energy.emit()
	if current_energy > 10:
		energy_gain.emit()
	$Energy_bar.set_value(current_energy)


func _on_health_gain_timeout():
	# if both hunger and thrist bar are more than 90, then the health will increase
	if current_hunger and current_thrist > 90:
		current_health += 0.1
		if current_health > max:
			current_health = 100
	else:
		pass
	$Health_bar.set_value(current_health)

