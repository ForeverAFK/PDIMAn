extends Lesson_info

var Next_Screen : PackedScene = preload("res://Screens/screen_exercises.tscn")

func _ready():
	$"../ContainerUpperBar/UpperBar/LabelSampleText".text = "Итак, приступим..."
	$Button.text = GLOBALS.TOPIC_NAMES[0]
	$Button2.text = GLOBALS.TOPIC_NAMES[1]
	$Button3.text = GLOBALS.TOPIC_NAMES[2]
	$Button4.text = GLOBALS.TOPIC_NAMES[3]
	$Button5.text = GLOBALS.TOPIC_NAMES[4]
	$Button6.text = GLOBALS.TOPIC_NAMES[5]
	
func _on_button_pressed():
	set_topic_id(1)
	get_tree().change_scene_to_packed(Next_Screen)


func _on_button_2_pressed():
	set_topic_id(2)
	get_tree().change_scene_to_packed(Next_Screen)


func _on_button_3_pressed():
	set_topic_id(3)
	get_tree().change_scene_to_packed(Next_Screen)


func _on_button_4_pressed():
	set_topic_id(4)
	get_tree().change_scene_to_packed(Next_Screen)


func _on_button_5_pressed():
	set_topic_id(5)
	get_tree().change_scene_to_packed(Next_Screen)


func _on_button_6_pressed():
	set_topic_id(6)
	get_tree().change_scene_to_packed(Next_Screen)
