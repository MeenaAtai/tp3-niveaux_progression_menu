extends Area2D

@export var scene_fin: String = "res://scenes/jeu_level_end.tscn"
@export var id_cle: String = "cle"  # même nom que la clé correspondante

@onready var anim: AnimationPlayer = $AnimationPlayer

var cle_obtenue := false

func _ready() -> void:
	# Par défaut : cristal fermé
	anim.play("close")
	$son.play()

	# Le SceneManager signale quand une clé est prise
	SceneManager.cle_collectee.connect(_on_cle_collectee)
	

func _on_cle_collectee(cle: Node) -> void:
	# Vérifie si c'est la bonne clé
	if cle.is_in_group(id_cle):
		cle_obtenue = true
		anim.play("open")
		$son.play()


func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		if cle_obtenue:
			# Charger la scène de fin
			var scene := load(scene_fin)
			get_tree().change_scene_to_packed(scene)
