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

signal player_speed_modified(percentage_increase)

@export var card_id = ID.PLAYER_SPEED_10

var lower_bound: int
var upper_bound: int

func _ready():
	var range = chances[card_id]
	lower_bound = randi() % (100 - range)
	upper_bound = lower_bound + range

func activate():
	_apply_effect(false)

func deactivate():
	_apply_effect(true)

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
