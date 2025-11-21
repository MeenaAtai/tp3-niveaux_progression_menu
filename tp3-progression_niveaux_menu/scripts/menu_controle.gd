extends CanvasLayer

const PLAY_ICON = preload("res://assets/UI_UX/Free_UI_Button_Icons/Sprite_png/play button.png")
const PAUSE_ICON = preload("res://assets/UI_UX/Free_UI_Button_Icons/Sprite_png/pause button.png")


func _ready() -> void:
	$PauseButton.icon = PAUSE_ICON
	$PauseMenu.hide()
	%InstructionsScreen.hide()


func _on_pause_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		pauser()
		$ClickSound.play()
	else:
		continuer()
		$ClickSound.play()


func pauser():
	print("PAUSE MODE")
	$PauseButton.icon = PLAY_ICON
	$PauseMenu.show()
	get_tree().paused = true
	%OptionButton.grab_focus.call_deferred()


func continuer():
	print("PLAY MODE")
	$PauseButton.icon = PAUSE_ICON
	$PauseMenu.hide()
	%InstructionsScreen.hide()
	get_tree().paused = false
	$ClickSound.play()


func _on_option_button_pressed() -> void:
	%InstructionsScreen.show()
	%InstructionsScreen/CloseButton.grab_focus.call_deferred()
	$ClickSound.play()


func _on_close_instructions_button_pressed() -> void:
	%InstructionsScreen.hide()
	%OptionButton.grab_focus.call_deferred()
	$ClickSound.play()


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	$ClickSound.play()
	await get_tree().create_timer(0.5).timeout  
	get_tree().reload_current_scene()
