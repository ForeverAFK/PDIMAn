extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var currentTime = Time.get_time_string_from_system()
	text = currentTime 
