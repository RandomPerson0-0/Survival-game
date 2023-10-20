extends Node2D

@export var water_scene: PackedScene
@export var food_scene: PackedScene
@export var health_scene: PackedScene
@export var side_enemy_scene: PackedScene


func _ready():
	pass


func _process(delta):
	# if the player press the Esc or the m keyboard, it will return to the main
	# menu
	if Input.is_action_pressed("menu"):
		get_tree().change_scene_to_file("res://Main_menu.tscn")
	pass


func _on_restart_pressed():
	# if the player press the button restart, it will restart the game
	get_tree().reload_current_scene()


func _on_food_water_timer_timeout():
	# when the timer starts, it will randomly spawn the water and the food in
	# the main scene
	var water_spawn_y = randf_range(540, 550)
	var water_spawn_x = randf_range(0, 4000)
	var water = water_scene.instantiate()
	water.position.y = water_spawn_y
	water.position.x = water_spawn_x
	add_child(water)
	var food_spawn_y = randf_range(540, 550)
	var food_spawn_x = randf_range(0, 4000)
	var food = food_scene.instantiate()
	food.position.y = food_spawn_y
	food.position.x = food_spawn_x
	add_child(food)


func _on_power_up_timer_timeout():
	# when the timer starts, it will randomly spawn the power up the main scene
	# the difference between the food and water, is the time
	var health_spawn_y = randf_range(540, 550)
	var health_spawn_x = randf_range(0, 4000)
	var health = health_scene.instantiate()
	health.position.y = health_spawn_y
	health.position.x = health_spawn_x
	add_child(health)


func _on_enemy_timer_timeout():
	# when the timer starts, it will randomly spawn the enemy in
	# the main scene, on different location
	var side_enemy_y = randf_range(0, 0)
	var side_enemy_x = randf_range(0, 3000)
	var side_enemy = side_enemy_scene.instantiate()
	side_enemy.position.y = side_enemy_y
	side_enemy.position.x = side_enemy_x
	add_child(side_enemy)

