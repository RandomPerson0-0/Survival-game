extends Area2D
signal water

# Called when the node enters the scene tree for the first time.
func _ready():
	#this connects the water signal to the status where it then connects on the function
	water.connect(get_node("/root/Main/UI/Status")._on_water_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# this makes sure that the water bar will only add up when the player 
	# touches it
	if body.has_meta("Player"):
		water.emit(body)
	queue_free()


func _on_area_entered(area):
	queue_free()