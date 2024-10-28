extends RichTextLabel

const DEFAULT_TEXT : String = "Выбери, чем ты собираешься заняться сегодня"

func _on_button_theory_mouse_entered():
	text = "Изучи краткую теоретическую справку по уроку!"

func _on_button_theory_mouse_exited():
	text = DEFAULT_TEXT

func _on_button_pract_mouse_entered():
	text = "Попробуй воспроизвести то, что ты увидел, будто ты на коллоке!"

func _on_button_pract_mouse_exited():
	text = DEFAULT_TEXT

func _on_button_exercise_mouse_entered():
	text = "Думаешь, что разбираешься в теме? Попробуй решить парочку практических задач..."

func _on_button_exercise_mouse_exited():
	text = DEFAULT_TEXT
