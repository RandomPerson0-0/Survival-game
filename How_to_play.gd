extends Node2D


func _ready():
	pass 


func _process(delta):
	pass


func _on_return_pressed():
	# when player hits the return button, the scene returns to the main menu
	get_tree().change_scene_to_file("res://Main_menu.tscn")


func _on_exit_pressed():
	# game ends
	get_tree().quit()
