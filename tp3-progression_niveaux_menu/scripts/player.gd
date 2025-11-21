class_name Player
extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var jump_count = 0 
var is_dead: bool = false 

@onready var audioJump = $audioJump
@onready var audiodeath = $audioDeath
@onready var sprite := $AnimatedSprite2D   


func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	# Saut simple + double saut
	if Input.is_action_just_pressed("jump") and jump_count == 1:
		velocity.y = JUMP_VELOCITY
		audioJump.play()
		jump_count = 2
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audioJump.play()
		jump_count = 1
	
	if !Input.is_action_just_pressed("jump") and is_on_floor():
		jump_count = 0

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
	animations(direction)
	
	if direction == 1:
		sprite.flip_h = false
	elif direction == -1:
		sprite.flip_h = true


func animations(direction):
	if is_dead:
		sprite.play("death")
		return

	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		if velocity.y < 0:
			sprite.play("jump")
		elif velocity.y > 0:
			sprite.play("fall")
			


func activate_lever(lever: Area2D) -> void:
	var direction := 1
	if sprite.flip_h:
		direction = -1

	lever.turn_lever(direction)


# Fonction de mort
func mourir():
	if is_dead:
		return

	is_dead = true
	velocity = Vector2.ZERO
	audiodeath.play()
	sprite.play("death")
