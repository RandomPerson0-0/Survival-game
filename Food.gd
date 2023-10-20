extends Area2D

signal food

func _ready():
	# connects specific function, to another function in another scene
	food.connect(get_node("/root/Main/UI/Status")._on_food_body_entered)


func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# if the player has touched the food, then it will signal the _on_food_body_entered
	# in the status scene
	if body.has_meta("Player"):
		food.emit(body)
	queue_free()


func _on_area_entered(area):
	# if anything touches the food, it will disappear but will not increase the
	# food stats
	queue_free()

