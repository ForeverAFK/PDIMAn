extends RichTextLabel


@onready var GLOBALS = get_node("/root/Globals")
const DEFAULT_TEXT : String = "Выбери тему"

# Called when the node enters the scene tree for the first time.
func _ready():
	text = DEFAULT_TEXT

func _on_button_mouse_entered():
	text =  "Выбрана тема " + str(str(Globals.TOPIC_NAMES[0]).split("\n", 0)[0]) + " " + str(str(Globals.TOPIC_NAMES[0]).split("\n", 0)[1])
	
func _on_button_mouse_exited():
	text = DEFAULT_TEXT
	
	
func _on_button_2_mouse_entered():
	text =  "Выбрана тема " + str(str(Globals.TOPIC_NAMES[1]).split("\n", 0)[0]) + " " + str(str(Globals.TOPIC_NAMES[1]).split("\n", 0)[1])
	
func _on_button_2_mouse_exited():
	text = DEFAULT_TEXT


func _on_button_3_mouse_entered():
	
	text =  "Выбрана тема " + str(str(Globals.TOPIC_NAMES[2]).split("\n", 0)[0]) + " " + str(str(Globals.TOPIC_NAMES[2]).split("\n", 0)[1])
	
func _on_button_3_mouse_exited():
	text = DEFAULT_TEXT
	
	
func _on_button_4_mouse_entered():
	
	text =  "Выбрана тема " + str(str(Globals.TOPIC_NAMES[3]).split("\n", 0)[0]) + " " + str(str(Globals.TOPIC_NAMES[3]).split("\n", 0)[1])
	
func _on_button_4_mouse_exited():
	text = DEFAULT_TEXT
	
func _on_button_5_mouse_entered():
	
	text =  "Выбрана тема " + str(str(Globals.TOPIC_NAMES[4]).split("\n", 0)[0]) + " " + str(str(Globals.TOPIC_NAMES[4]).split("\n", 0)[1])
	
func _on_button_5_mouse_exited():
	text = DEFAULT_TEXT
	
func _on_button_6_mouse_entered():
	
	text =  "Выбрана тема " + str(str(Globals.TOPIC_NAMES[5]).split("\n", 0)[0]) + " " + str(str(Globals.TOPIC_NAMES[5]).split("\n", 0)[1])
	
func _on_button_6_mouse_exited():
	text = DEFAULT_TEXT




