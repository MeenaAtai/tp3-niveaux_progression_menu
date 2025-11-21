extends StaticBody2D

@export var link_code: int = 0

var is_open: bool = false

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	add_to_group("door")
	collision_shape.disabled = false
	animation_player.play("idle")

	# auto connexion
	var levers = get_tree().get_nodes_in_group("lever")
	connect_to_lever(levers)

func connect_to_lever(levers):
	for lever in levers:
		if lever.link_code == link_code:
			lever.lever_turned.connect(_on_lever_turned)
			print("[Door] Connecté au levier code", link_code)

func _on_lever_turned(code):
	if code == link_code:
		print("[Door] Signal reçu → ouverture/fermeture")
		_change_state()

func _change_state() -> void:
	is_open = not is_open
	if is_open:
		animation_player.play("open")
	else:
		animation_player.play_backwards("open")

func _on_animation_player_animation_finished(anim_name: String) -> void:
	if not is_open and anim_name == "open":
		animation_player.play("idle")
