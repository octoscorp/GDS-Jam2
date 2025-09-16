extends Node

class_name Card

enum ID {
	PLAYER_SPEED_10,
	PLAYER_SPEED_10_NEGATIVE,
}

# Percentage chance that a given luck value falls within the bounds
const chances = {
	ID.PLAYER_SPEED_10: 10,
}

const descriptions = {
	ID.PLAYER_SPEED_10: "+10% PLAYER movement speed",
	ID.PLAYER_SPEED_10_NEGATIVE: "+10% PLAYER movement speed",
}

const _icon_array = {
	"BOOT": "res://media/boot.png",
	"BULLET": "res://media/bullet.png",
}

const icons = {
	ID.PLAYER_SPEED_10: _icon_array["BOOT"],
}

# information signals
signal card_activation_changed(id: Card.ID, active: bool)

# control signals
signal player_speed_modified(percentage_increase)

@export var card_id = ID.PLAYER_SPEED_10

var lower_bound: int
var upper_bound: int
var is_active: bool = false

func _ready():
	var range = chances[card_id]
	lower_bound = randi() % (100 - range)
	upper_bound = lower_bound + range

func activate(current_luck: int):
	var in_range = (current_luck >= lower_bound && current_luck < upper_bound)
	# XOR
	if is_active ^ in_range:
		_apply_effect(is_active)
		is_active = not is_active
		card_activation_changed.emit(card_id, is_active)

func mult_value(value: int, invert: bool):
	return (1 / value) if invert else value

# Applies card effect (removes if remove is true)
func _apply_effect(remove):
	match card_id:
		ID.PLAYER_SPEED_10:
			# WARNING: Does not cancel to 1.
			player_speed_modified.emit(mult_value(1.1, remove))
		ID.PLAYER_SPEED_10_NEGATIVE:
			player_speed_modified.emit(mult_value(0.9, remove))
