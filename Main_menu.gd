extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# these function works when the player press the three options they have which 
#then they will be moved to these scenes
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://How_to_play.tscn")

func _on_quit_pressed():
	get_tree().quit()
