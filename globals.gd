extends Node

var start_scene = "res://Screens/screen_chapter_select.tscn"
var CHAPTER_NAMES = ["ГЛАВА 1:\nПРОИЗВОДНЫЕ", "ГЛАВА 2:\nПРОИЗВОДНЫЕ", "ГЛАВА 3:\nПРОИЗВОДНЫЕ", "ГЛАВА 4:\nПРОИЗВОДНЫЕ","ГЛАВА 5:\nПРОИЗВОДНЫЕ","ГЛАВА 6:\nПРОИЗВОДНЫЕ"]
var TOPIC_NAMES = ["ПРОИЗВОДНЫЕ\n1 ПОРЯДКА", "ПРОИЗВОДНЫЕ\n1 ПОРЯДКА", "ПРОИЗВОДНЫЕ\n1 ПОРЯДКА", "ПРОИЗВОДНЫЕ\n1 ПОРЯДКА", "ПРОИЗВОДНЫЕ\n1 ПОРЯДКА", "ПРОИЗВОДНЫЕ\n1 ПОРЯДКА",]
var CHAPTER_ID : int
var TOPIC_ID : int
var TASKTYPE_ID : int
var CORRECT_ANS : String = ""
var POINTS : float = 0	#current points in a lesson
var OVERALL_POINTS : float = 0	#current points in a lesson
var ACTIONS_LEFT : int = 5 # default == 5, don't set to <0
var ACTIONS_MAX : int = 5 

