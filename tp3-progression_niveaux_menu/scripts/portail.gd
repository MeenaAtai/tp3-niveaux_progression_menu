extends StaticBody2D

@onready var animatedSprite2D = $AnimatedSprite2D
@onready var collisionShape2D = $CollisionShape2D

@export var nouvelle_scene: PackedScene

var portail_open: bool = false

# Quand le joueur entre dans la zone d'activation
func _on_activate_door_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		if not portail_open:
			animatedSprite2D.play("open")
			portail_open = true
			collisionShape2D.set_deferred("disabled", true)

# Quand le joueur sort de la zone
func _on_activate_door_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		if portail_open:
			animatedSprite2D.play("close")
			portail_open = false
			collisionShape2D.set_deferred("disabled", false)

# Quand le joueur entre dans la zone de sortie
func _on_exit_area_2d_body_entered(body: Node2D) -> void:
	if body is Player and portail_open:
		SceneManager.changer_scene(nouvelle_scene)
