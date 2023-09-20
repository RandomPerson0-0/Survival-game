extends Node2D

@export var water_scene: PackedScene
@export var food_scene: PackedScene
@export var health_scene: PackedScene
@export var weapon_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("menu"):
		get_tree().change_scene_to_file("res://Main_menu.tscn")
	pass

func _on_restart_pressed():
	#if the player press the button restart, it will restart the game
	get_tree().reload_current_scene()


func _on_food_and_water_timeout():
	# when the timer starts, it will randomly spawn the water and the food in
	# the main scene
	var water_spawn_y = randf_range(685, 755)
	var water_spawn_x = randf_range(25, 2000)
	var water = water_scene.instantiate()
	water.position.y = water_spawn_y
	water.position.x = water_spawn_x
	add_child(water)
	var food_spawn_y = randf_range(685, 755)
	var food_spawn_x = randf_range(25, 2000)
	var food = food_scene.instantiate()
	food.position.y = food_spawn_y
	food.position.x = food_spawn_x
	add_child(food)


func _on_power_up_timer_timeout():
	var health_spawn_y = randf_range(685, 755)
	var health_spawn_x = randf_range(25, 2000)
	var health = health_scene.instantiate()
	health.position.y = health_spawn_y
	health.position.x = health_spawn_x
	add_child(health)


func _on_weapon_timeout():
	var weapon = weapon_scene.instantiate()
	add_child(weapon)
	print("weapon spawn")
