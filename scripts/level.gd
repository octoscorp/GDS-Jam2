extends Node2D

signal luck_value_changed

const CHEST = preload("res://scenes/chest.tscn")
const LUCK_MAX = 99
const XP_THRESHOLD_INCREASE = 1.2

var xp_threshold = 4
var experience_counter = 0
var luck_value = 0

func _ready():
	reroll_luck_value()
	
func reroll_luck_value():
	luck_value = randi() % (LUCK_MAX + 1)
	$PlayerCamera/HUD.display_luck_value(luck_value)

func _on_luck_reroll_timer_timeout() -> void:
	reroll_luck_value()

func _on_luck_value_changed() -> void:
	# All abilities are configured upon this change
	pass # Replace with function body.

func _on_enemy_died(location: Vector2):
	experience_counter += 1
	if experience_counter < xp_threshold:
		return
	experience_counter = 0
	xp_threshold = int(xp_threshold * XP_THRESHOLD_INCREASE)
	var chest = CHEST.instantiate()
	chest.global_position = location
	get_tree().root.add_child(chest)
