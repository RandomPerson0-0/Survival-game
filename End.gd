extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
