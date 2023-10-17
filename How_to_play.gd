extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_pressed():
	# when player hits the return button, the scene returns to the main menu
	get_tree().change_scene_to_file("res://Main_menu.tscn")


func _on_exit_pressed():
	# game ends
	get_tree().quit()
