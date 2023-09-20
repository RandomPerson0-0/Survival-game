extends RichTextLabel

var enemy_num = 1
signal enemy_added

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text("		Enemies: " + str(enemy_num))


func _on_timer_timeout():
	enemy_num += 1


func _on_enemy_added():
	enemy_num += 1
