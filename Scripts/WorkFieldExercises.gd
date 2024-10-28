extends Lesson_info

#var Theory_Screen : PackedScene = preload("res://Screens/screen_task_test.tscn")
var TheoExer_Screen : PackedScene = preload("res://Screens/screen_task_test.tscn")
var Exer_Screen : PackedScene = preload("res://Screens/screen_task_test.tscn")


func _ready():
	$"../ContainerUpperBar/UpperBar/LabelSampleText".text = str(str(Globals.TOPIC_NAMES[Globals.TOPIC_ID - 1]).split("\n", 0)[0])

func _on_button_mouse_entered():
	$"../ContainerLowerBar/MessageBox".text = "Назад"


func _on_button_mouse_exited():
	$"../ContainerLowerBar/MessageBox".text = ""


func _on_button_theory_pressed():
	#get_tree().change_scene_to_packed(Theory_Screen)
	$"../ContainerTheoryPopUp".visible = true
	var load_path : String = "res://Resources/" + str(Globals.CHAPTER_ID) + "/" + str(Globals.TOPIC_ID) + "/theo.txt"	
	var content = FileAccess.get_file_as_string(load_path)
	$"../ContainerTheoryPopUp/VBoxContainer/LabelTheory".text = content


func _on_button_pract_pressed():
	set_task_id(1)
	get_tree().change_scene_to_packed(Exer_Screen)


func _on_button_exercise_pressed():
	set_task_id(2)
	get_tree().change_scene_to_packed(Exer_Screen)
