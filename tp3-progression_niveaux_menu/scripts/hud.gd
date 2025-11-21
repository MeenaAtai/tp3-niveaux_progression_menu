extends CanvasLayer

@onready var keys = [
	$HBoxContainer/Key1,
	$HBoxContainer/Key2,
	$HBoxContainer/Key3
]

@onready var label_score = $HBoxContainer2/Label

func _ready() -> void:
	await get_tree().process_frame

	# Connexions habituelles
	if not SceneManager.is_connected("cles_initialisees", Callable(self, "_on_cles_initialisees")):
		SceneManager.connect("cles_initialisees", Callable(self, "_on_cles_initialisees"))

	if not SceneManager.is_connected("cle_collectee", Callable(self, "_on_cle_collectee")):
		SceneManager.connect("cle_collectee", Callable(self, "_on_cle_collectee"))

	# ✅ Connexion pour le score
	if not SceneManager.is_connected("score_change", Callable(self, "_on_score_change")):
		SceneManager.connect("score_change", Callable(self, "_on_score_change"))

	SceneManager.initialiser_cles()
	mettre_a_jour_score(SceneManager.score)


func _on_score_change(nouveau_score: int) -> void:
	mettre_a_jour_score(nouveau_score)


func mettre_a_jour_score(score: int) -> void:
	label_score.text = str(score)

func _on_cles_initialisees(total: int) -> void:
	print("🎯 HUD → clés initialisées :", total)
	mettre_a_jour_affichage()


func _on_cle_collectee(cle: Node) -> void:
	print("🗝️ HUD → clé récupérée :", cle.name)
	mettre_a_jour_affichage()


func mettre_a_jour_affichage() -> void:
	var total = SceneManager.total_cles
	var recup = SceneManager.cles_recuperees

	for i in range(keys.size()):
		if i < total:
			keys[i].visible = true
			# Si la clé est récupérée → opaque (1.0), sinon transparente (0.4)
			keys[i].modulate.a = 1.0 if i < recup else 0.4
		else:
			keys[i].visible = false
