extends Node

var savefile = "user://profile_data.dat"

@onready var GLOBALS = get_node("/root/Globals")

func save_profile():
	var file := ConfigFile.new()
	file.set_value("Player", "score", GLOBALS.OVERALL_POINTS)
	var err := file.save(savefile)
	if err != OK:
		push_error("error saving score " + str(err))

func load_profile():
	var file := ConfigFile.new()
	var error := file.load(savefile)
	if error != OK:
		push_error("error loading score " + str(error))
		return
	GLOBALS.OVERALL_POINTS = int(file.get_value("Player", "score"))
