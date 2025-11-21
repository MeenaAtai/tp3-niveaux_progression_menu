extends Area2D

@export var groupe_cle: String = "cle"

func _ready() -> void:
	add_to_group(groupe_cle)
	$AnimatedSprite2D.play("cle")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		SceneManager.debloquer_cle(self)
		call_deferred("_desactiver_cle")

func _desactiver_cle() -> void:
	$CollisionShape2D.disabled = true
	$AnimatedSprite2D.visible = false
	%CleSfx.play()
	await %CleSfx.finished
	queue_free()
