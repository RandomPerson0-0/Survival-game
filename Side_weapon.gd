extends Area2D

var speed = 350
signal weapon

# Called when the node enters the scene tree for the first time.
func _ready():
	weapon.connect(get_node("/root/Main//UI/Status")._on_side_weapon_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_node("/root/Main/Player").position)
	move_local_x(speed * delta)


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_meta("Player"):
		weapon.emit(body)
	queue_free()
