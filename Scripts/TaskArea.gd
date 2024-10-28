extends "res://Scripts/lesson_info.gd"

var Messages_fail = ["Нет!", "Неверно!", "Попробуй ещё раз, ну же!", "Не угадал!", "Мимо!", "А если подумать?"]
var Messages_pass = ["Верно!", "Всё так", "Абсолютно верно!", "Правильно!", "И это правильный ответ!", "Не 42, но тоже cойдёт..."]
var Message_congrats = [ "ПРОСТО ОТЛИЧНО!", "ТАК ДЕРЖАТЬ!", "МОЖНО И ЛУЧШЕ", "", "КАК-ТО НЕ ОЧЕНЬ...","НАДО ПОДУЧИТЬСЯ..."]

@onready var isAnswered = false
@onready var isFirstAnswer = true
@onready var stdPoints : float = 1

func _ready():
	ChooseLesson()
	if Globals.TASKTYPE_ID == 1:
		$Button1/LabelButton.text = TASK_VARS[0]
		$Button2/LabelButton.text = TASK_VARS[1]
		$Button3/LabelButton.text = TASK_VARS[2]
		$Button4/LabelButton.text = TASK_VARS[3]
	else:
		$Button1.text = TASK_VARS[0]
		$Button2.text = TASK_VARS[1]
		$Button3.text = TASK_VARS[2]
		$Button4.text = TASK_VARS[3]
	$"../MessageTask".text = TASK_TEXT
	$"../../ContainerUpperBar/UpperBar/LabelSampleText".text = GLOBALS.TOPIC_NAMES[GLOBALS.TOPIC_ID - 1].split("\n")[0] + " " + GLOBALS.TOPIC_NAMES[GLOBALS.TOPIC_ID - 1].split("\n")[1] + " | Очки: " + str(GLOBALS.OVERALL_POINTS) + " | Осталось выполнить: " + str(GLOBALS.ACTIONS_LEFT) 
	#GLOBALS.POINTS = stdPoints
	if GLOBALS.ACTIONS_LEFT == 0:
		GLOBALS.ACTIONS_LEFT = GLOBALS.ACTIONS_MAX
		reveal_finale_message(GLOBALS.ACTIONS_MAX - int(GLOBALS.POINTS))
		GLOBALS.POINTS = 0
		if GLOBALS.OVERALL_POINTS < 0:
			GLOBALS.OVERALL_POINTS = 0
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file(GLOBALS.start_scene)
	
func ans_check(_button, i, points):
	if str(TASK_VARS[i]) == GLOBALS.CORRECT_ANS:
		$"../../ContainerLowerBar/LogBox".text = Messages_pass.pick_random()
		GLOBALS.OVERALL_POINTS += points 
		GLOBALS.POINTS += points 
		GLOBALS.ACTIONS_LEFT -= 1
		#GLOBALS.CURRENT_ANS = -1
		isAnswered = true 
		await get_tree().create_timer(3).timeout#skip_time()
		SAVESYS.save_profile()
		get_tree().reload_current_scene()
	else:
		if !isFirstAnswer:
			$"../../ContainerLowerBar/LogBox".text = "Увы, это не так." + '\n' +"В следующий раз будь готов!"
			GLOBALS.ACTIONS_LEFT -= 1
			GLOBALS.POINTS -= (stdPoints / 6) 
			await get_tree().create_timer(3).timeout#skip_time()
			SAVESYS.save_profile()
			get_tree().reload_current_scene()
		else:
			#button.DRAW_DISABLED
			#skip_time()
			isFirstAnswer = false
			GLOBALS.POINTS -= int(stdPoints / 3)
			$"../../ContainerLowerBar/LogBox".text = Messages_fail.pick_random()
		

func _on_button_1_pressed():
	if !isAnswered:
		ans_check($Button1, 0, stdPoints)

func _on_button_2_pressed():
	if !isAnswered:
		ans_check($Button2, 1, stdPoints)
	
func _on_button_3_pressed():
	if !isAnswered:
		ans_check($Button3, 2, stdPoints)

func _on_button_4_pressed():
	if !isAnswered:
		ans_check($Button4, 3, stdPoints)
		


func reveal_finale_message(grade):
	$"../../ContainerFinale".visible = true
	$"../../ContainerFinale/GratsField/LabelFinale".text = Message_congrats[grade]
	$"../../ContainerFinale/GratsField/FinaleMessage".text = $"../../ContainerFinale/GratsField/FinaleMessage".text + " " + str(GLOBALS.POINTS)


