extends Area2D
signal water


func _ready():
	#this connects the water signal to the status where it then connects on the function
	water.connect(get_node("/root/Main/UI/Status")._on_water_body_entered)


func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# this makes sure that the water bar will only add up when the player 
	# touches it
	if body.has_meta("Player"):
		water.emit(body)
	queue_free()


func _on_area_entered(area):
	# if anything other than the player touches the water, it disappears but it 
	# will not affect the status of the water bar
	queue_free()
