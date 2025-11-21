extends StaticBody2D

@export var id_cle: String = "cle"

func _ready() -> void:
	add_to_group(id_cle)
	SceneManager.cle_collectee.connect(debloquer)
	$AnimatedSprite2D.play("obstacle")

func debloquer(cle: Node) -> void:
	if cle.is_in_group(id_cle):
		print("Porte débloquée :", id_cle)
		call_deferred("queue_free")
