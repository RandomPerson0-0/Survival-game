extends RichTextLabel

signal timer_stop

var seconds = 0
var minutes = 0

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if seconds > 59:
		minutes += 1
		seconds = 0
		
	set_text(str(minutes)+ " : " +str(seconds))
	

func _on_countdown_timeout():
	seconds += 1


func _on_timer_stop():
	get_tree().paused
