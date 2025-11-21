extends CharacterBody2D
class_name Enemy2

signal ennemi_elimine

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var soundHit: AudioStreamPlayer2D = $soundHit
@onready var soundExplode: AudioStreamPlayer2D = $soundExplode
@onready var explosion: CPUParticles2D = $explosion
@onready var soundDeath: AudioStreamPlayer2D = $soundDeath

const SPEED = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.LEFT
var health = 1

var killed_by_player := false   # <-- IMPORTANT


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = direction.x * SPEED
	move_and_slide()

	if is_on_wall():
		direction *= -1

	_set_animation()

	if health <= 0:
		_die()


func _set_animation() -> void:
	sprite.flip_h = direction.x < 0
	animationPlayer.play("run")


# --- Player saute sur l'ennemi, ou le touche ---
func _on_get_damaged_box_body_entered(body: Node2D) -> void:
	if body.name.to_lower().contains("player"):
		health -= 1
		killed_by_player = true  # <-- Mort causée par le joueur
		soundHit.play()


# --- Mort de l'ennemi ---
func _die() -> void:
	$CollisionShape2D.disabled = true
	set_physics_process(false)
	animationPlayer.play("death")

	# SON DE MORT UNIQUEMENT SI PAS TUÉ PAR LE PLAYER
	if not killed_by_player:
		soundDeath.play()


# --- Fin de l'animation de mort ---
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		explosion.emitting = true
		soundExplode.play()

		emit_signal("ennemi_elimine")

		await get_tree().create_timer(0.5).timeout
		queue_free()
