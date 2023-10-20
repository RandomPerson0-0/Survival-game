extends Area2D

signal power_up


func _ready():
	# connects specific function, to another function in another scene
	power_up.connect(get_node("/root/Main/UI/Status")._on_power_up_body_entered)


func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# if the player touches power up, it will call to the _on_power_up_body_entered
	# changing the stats of the health
	if body.has_meta("Player"):
		power_up.emit(body)
	queue_free()


func _on_area_entered(area):
	# when anything other than player touches it, it will disappear but will not
	# affect the stats
	queue_free()


func _on_timer_timeout():
	# if the time hits 0, the power up will disappear
	queue_free()

