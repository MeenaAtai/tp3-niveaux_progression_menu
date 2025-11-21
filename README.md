# TP3 – Niveaux, Progression & Menu

## Description
Petit projet réalisé avec **Godot 4** comprenant un niveau jouable, un personnage dynamique et un environnement physique interactif.  
Le jeu met en place une logique de mouvement, d’interactions et d’états du personnage dans un espace cohérent et fonctionnel.

Les éléments principaux incluent :
- l’utilisation d’un **TileMap** pour créer un environnement interactif et cohérent,
- la gestion des **entrées clavier** déclenchant mouvements, sons et animations,
- l’intégration d’un **parallax background** qui s’adapte automatiquement à la taille de la fenêtre,
- des événements de gameplay permettant au joueur **d’éliminer les ennemis en leur sautant dessus**,
- une **interface de menu** utilisant sprites et boutons synchronisés avec les événements du jeu.


## Fonctionnalités

### TileMap
- Détection des collisions entre le joueur, le TileMap et les ennemis.  
- Gestion de la physique et des collisions pour un environnement stable.  
- Création d’un niveau navigable avec plateformes, murs et limites.

### Objets interactifs & Comportements dynamiques
- Le joueur peut éliminer un ennemi en **sautant dessus**, grâce aux collisions verticales.  
- Ajout de **sons**, **effets visuels** et **particules** selon les événements (mort ennemi, saut réussi, etc.).

### Déplacements du joueur (Clavier)
- **Flèche gauche / A** : déplacement vers la gauche + animation de course (`run`).  
- **Flèche droite / D** : déplacement vers la droite + animation de course (`run`).  
- **Flèche haut / W** : saut + double saut + animation (`jump`).  
- **Flèche bas / S** : descente rapide + animation (`fall`).  

### Fond Parallax
- Image de fond ajustée automatiquement à la taille de la fenêtre.  
- Effet parallax offrant une sensation de **profondeur** et un mouvement immersif.

### Interface Menu
- Interface composée de **sprites**, **boutons** et signaux connectés aux actions du jeu.  
- Navigation simple et intuitive entre les écrans (menu, jeu, redémarrage, etc.).

 
 ## Crédits
 - **joueur :**
   - https://oboropixel.itch.io/character-animations
 - **Ennemie :**
   - https://nastanliev.itch.io/mushrooms
 - **Audio :**
   - https://freesound.org/people/orginaljun/sounds/534347/
   - https://freesound.org/people/BloodPixelHero/sounds/584075/
   - https://sfxr.me/
 - **TileMap et fond:**
   - https://theflavare.itch.io/forest-nature-fantasy-tileset
 - **Particules :**
   - https://rustybulletgames.itch.io/colored-explosions-asset-pack
 - **Font :**
   - https://www.dafont.com/fr/kiwisoda.font
 - **Interface menu (cadres) :**
   - 

