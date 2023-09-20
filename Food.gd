extends Area2D
signal food

# Called when the node enters the scene tree for the first time.
func _ready():
	food.connect(get_node("/root/Main/UI/Status")._on_food_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_meta("Player"):
		food.emit(body)
	queue_free()


func _on_area_entered(area):
	queue_free()
