extends Area2D

var speed = 300
signal weapon

# Called when the node enters the scene tree for the first time.
func _ready():
	weapon.connect(get_node("/root/Main//UI/Status")._on_side_weapon_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# the side enemy will follow the player position
	look_at(get_node("/root/Main/Player").position)
	move_local_x(speed * delta)


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# if the side enemy has touched the player, it will signal the _on_side_weapon_body_entered
	# in Status which will chnage the health stats
	if body.has_meta("Player"):
		weapon.emit(body)
	queue_free()

