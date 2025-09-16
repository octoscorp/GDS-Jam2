extends Node2D

signal luck_value_changed

const LUCK_MAX = 99

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
