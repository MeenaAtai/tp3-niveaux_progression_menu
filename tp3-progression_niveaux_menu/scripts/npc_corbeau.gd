extends CharacterBody2D

const speed = 30
var current_state = IDLE

var is_roaming = true
var is_chatting = false

var player
var player_is_chat_zone = false

enum {
	IDLE,
	NEW_DIR,
	MOVE
}
