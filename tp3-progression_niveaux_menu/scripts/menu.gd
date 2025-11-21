extends CanvasLayer


func _on_jouer_pressed() -> void:
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	

func _on_instructions_pressed() -> void:
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")
