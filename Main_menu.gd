extends Control


func _ready():
	pass 


func _process(delta):
	pass

# these function works when the player press the three options they have which 
#then they will be moved to these scenes
func _on_start_pressed():
	# the main game starts
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_how_to_play_pressed():
	# change the scene from main menu, to the how to play
	get_tree().change_scene_to_file("res://How_to_play.tscn")


func _on_quit_pressed():
	# game ends
	get_tree().quit()

