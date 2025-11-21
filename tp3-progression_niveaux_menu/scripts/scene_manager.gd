extends Node

signal cle_collectee(cle)
signal cles_initialisees(total)
signal toutes_cles_collectees
signal score_change(nouveau_score)

var total_cles: int = 0
var cles_recuperees: int = 0
var score: int = 0


# Initialise les clés et les ennemis du niveau actuel
func initialiser_cles() -> void:
	await get_tree().process_frame

	var current_scene = get_tree().current_scene
	var cles = []

	# Trouve les clés présentes dans la scène actuelle
	for node in get_tree().get_nodes_in_group("cle"):
		if node.is_inside_tree() and current_scene.is_ancestor_of(node):
			cles.append(node)

	total_cles = cles.size()
	cles_recuperees = 0

	# Connecte tous les ennemis présents dans la scène actuelle
	for ennemi in get_tree().get_nodes_in_group("enemy"):
		enregistrer_ennemi(ennemi)

	print("🔧 Keys detected in current level:", total_cles)
	emit_signal("cles_initialisees", total_cles)


# Lorsqu'une clé est collectée
func debloquer_cle(cle: Node) -> void:
	cles_recuperees += 1
	print("🗝️ Key collected! Total:", cles_recuperees, "/", total_cles)
	emit_signal("cle_collectee", cle)

	# Si toutes les clés sont ramassées
	if cles_recuperees >= total_cles and total_cles > 0:
		print("✅ Toutes les clés ont été ramassées !")
		emit_signal("toutes_cles_collectees")


# Changer de scène
func changer_scene(nouvelle_scene: PackedScene):
	print("🔄 Changement de scène")
	get_tree().call_deferred("change_scene_to_packed", nouvelle_scene)


# Connexion et gestion du score avec les ennemis
func enregistrer_ennemi(ennemi: Node) -> void:
	if not ennemi.is_connected("ennemi_elimine", Callable(self, "_on_ennemi_elimine")):
		ennemi.connect("ennemi_elimine", Callable(self, "_on_ennemi_elimine"))


func _on_ennemi_elimine() -> void:
	score += 1
	print("💀 Ennemi éliminé ! Score :", score)
	emit_signal("score_change", score)
