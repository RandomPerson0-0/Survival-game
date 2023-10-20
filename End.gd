extends Node2D


func _ready():
	pass


func _process(delta):
	pass


func _on_play_again_pressed():
	# if the player press the button play again, it will return back to the game
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_quit_pressed():
	# game quits
	get_tree().quit()


func _on_menu_pressed():
	# goes back to main menu
	get_tree().change_scene_to_file("res://Main_menu.tscn")

