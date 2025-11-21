extends Node2D

func _ready() -> void:
	$AnimatedSprite2D.play("jump")

	# Affiche le score récupéré depuis le SceneManager
	$Label4.text = str(SceneManager.score)

func _on_button_restart_pressed() -> void:
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_button_quit_pressed() -> void:
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().quit()
