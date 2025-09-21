extends Node2D

const CHEST = preload("res://scenes/chest.tscn")
const LUCK_MAX = 99
const XP_THRESHOLD_INCREASE = 1.2

@onready var music_player: AudioStreamPlayer = $MusicPlayer

var songs = [
	preload("res://media/music/The Robots Are Taking Over.mp3"),
	preload("res://media/music/The Highwaymans Bell Tolls.mp3"),
]
var current_song = 0

var xp_threshold = 4
var experience_counter = 0
var luck_value = 0

func _ready():
	reroll_luck_value()
	music_player.stream = songs[current_song]
	music_player.volume_db = -15
	music_player.play()
	Scores.current_score = 0
	
func reroll_luck_value():
	luck_value = randi() % (LUCK_MAX + 1)
	$PlayerCamera/HUD.display_luck_value(luck_value)
	var all_cards = get_tree().get_nodes_in_group("is_card")
	for card: Card in all_cards:
		# Apparently I wrote these with XOR logic, they'll handle whether or not to do it
		# This used to say "fancy XOR" but alas GDScript only supports bitwise for it
		card.activate(luck_value)

func _on_luck_reroll_timer_timeout() -> void:
	reroll_luck_value()

func _on_luck_value_changed() -> void:
	# All abilities are configured upon this change
	pass # Replace with function body.

func on_card_choice_start():
	get_tree().paused = true

func on_card_choice_end():
	var choice_ui = get_tree().get_first_node_in_group("is_card_choice")
	var selected_card = choice_ui.choice_made_callback()
	choice_ui.hide()
	get_tree().paused = false
	self.call_deferred("add_child", selected_card)
	choice_ui.call_deferred("queue_free")

func _on_enemy_died(location: Vector2):
	experience_counter += 1
	if experience_counter < xp_threshold:
		return
	experience_counter = 0
	xp_threshold = int(xp_threshold * XP_THRESHOLD_INCREASE)
	var chest = CHEST.instantiate()
	chest.global_position = location
	get_tree().root.add_child(chest)

func _on_music_player_finished() -> void:
	current_song = (current_song + 1) % songs.size()
	music_player.stream = songs[current_song]
	music_player.play()

func _on_player_player_damaged() -> void:
	get_tree().change_scene_to_file("res://scenes/end_score.tscn")
