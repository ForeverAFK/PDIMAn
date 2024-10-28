extends Node

class_name Lesson_info

@onready var GLOBALS = get_node("/root/Globals")
@onready var SAVESYS = get_node("/root/Saving")

#var TOPIC_ID
var TASK_TEXT : String
var TASK_VARS = Array([], TYPE_STRING, &"", null)
#var CORRECT_ANS = -1 #хе

func _ready():
	SAVESYS.load_profile()
	
func set_chapter_id(val):
	Globals.CHAPTER_ID = val

func set_topic_id(val):
	Globals.TOPIC_ID = val
	
func set_task_id(val):
	Globals.TASKTYPE_ID = val
	
func load_file(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	return content
	
func get_line_from_file(path):
	#var file = FileAccess.open(path, FileAccess.READ)
	var content : String = FileAccess.get_file_as_string(path)
	return content
	
func shuffle_array(array):
	var i = 0
	var arrsize = array.size()
	var ans_array = Array()
	GLOBALS.CORRECT_ANS = array[0]
	while i < arrsize:
		var temp = array.pick_random()
		array.erase(temp)
		ans_array.push_back(temp)
		i += 1
	return ans_array

func ChooseLesson():	# Организация урока
	#something about lesson ID
	var load_path : String = "res://Resources/" + str(Globals.CHAPTER_ID) + "/" + str(Globals.TOPIC_ID) + "/task" + str(Globals.TASKTYPE_ID) + ".txt"	
	var cur_strings = get_line_from_file(load_path).split('$')
	var RANDNUM = randi() % GLOBALS.ACTIONS_MAX
	TASK_TEXT = cur_strings[RANDNUM].get_slice("|",0)
	var possible_answs = Array(cur_strings[RANDNUM].get_slice("|", 1).split("#", false))
	TASK_VARS = shuffle_array(possible_answs)
