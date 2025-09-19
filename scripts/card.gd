extends Node

class_name Card

enum ID {
	# Player-affecting
	PLAYER_SPEED_10,
	PLAYER_SPEED_10_NEGATIVE,
	PLAYER_SPEED_20,
	PLAYER_SPEED_20_NEGATIVE,
	PLAYER_SPEED_30,
	PLAYER_SPEED_30_NEGATIVE,
	PLAYER_DAMAGE_IMMUNE,
	PLAYER_CRIT_CHANCE_10,
	PLAYER_CRIT_CHANCE_20,
	PLAYER_CRIT_CHANCE_30,


	# Enemy-affecting
	ENEMY_SPEED_10,
	ENEMY_SPEED_10_NEGATIVE,
	ENEMY_SPEED_20,
	ENEMY_SPEED_20_NEGATIVE,
	ENEMY_SPEED_30,
	ENEMY_SPEED_30_NEGATIVE,
	ENEMY_DAMAGE_IMMUNE,	# Scary! Small chance?


	# Projectiles
	PLAYER_PROJECTILE_SPEED_10,
	PLAYER_PROJECTILE_SPEED_10_NEGATIVE,
	PLAYER_PROJECTILE_PIERCE_1,
	PLAYER_PROJECTILE_PIERCE_2,
	PLAYER_PROJECTILE_PIERCE_3,
	PLAYER_PROJECTILE_BOUNCE_1,
	PLAYER_PROJECTILE_HOMING,	# Is this necessary? Already shooting directly at them

	ENEMY_PROJECTILE_SPEED_10,
	ENEMY_PROJECTILE_SPEED_10_NEGATIVE,
	ENEMY_PROJECTILE_PIERCE_BUT_FF,		# Piercing but gains friendly fire. With this in play, enemy damage upgrades may be worthwhile even in a one-hit game
	ENEMY_PROJECTILE_BOUNCE_1,
	ENEMY_PROJECTILE_HOMING,


	# Targeting
	PLAYER_TARGETS_PROJECTILES,
	ENEMY_TARGETS_PROJECTILES,
	ENEMY_TARGETS_ENEMY,	# Possibly OP
}

# 1 if not specified
const allowed_count = {
	ID.PLAYER_PROJECTILE_SPEED_10: 2,
	ID.PLAYER_PROJECTILE_SPEED_10_NEGATIVE: 3,
	ID.ENEMY_PROJECTILE_SPEED_10: 2,
	ID.ENEMY_PROJECTILE_SPEED_10_NEGATIVE: 3,
}

# Percentage chance that a given luck value falls within the bounds
const chances = {
	# Player-affecting
	ID.PLAYER_SPEED_10: 20,
	ID.PLAYER_SPEED_10_NEGATIVE: 15,
	ID.PLAYER_SPEED_20: 15,
	ID.PLAYER_SPEED_20_NEGATIVE: 10,
	ID.PLAYER_SPEED_30: 10,
	ID.PLAYER_SPEED_30_NEGATIVE: 6,
	ID.PLAYER_DAMAGE_IMMUNE: 5,
	ID.PLAYER_CRIT_CHANCE_10: 12,
	ID.PLAYER_CRIT_CHANCE_20: 10,
	ID.PLAYER_CRIT_CHANCE_30: 8,


	# Enemy-affecting
	ID.ENEMY_SPEED_10: 15,
	ID.ENEMY_SPEED_10_NEGATIVE: 15,
	ID.ENEMY_SPEED_20: 12,
	ID.ENEMY_SPEED_20_NEGATIVE: 12,
	ID.ENEMY_SPEED_30: 7,
	ID.ENEMY_SPEED_30_NEGATIVE: 7,
	ID.ENEMY_DAMAGE_IMMUNE: 3,


	# Projectiles
	ID.PLAYER_PROJECTILE_SPEED_10: 22,
	ID.PLAYER_PROJECTILE_SPEED_10_NEGATIVE: 20,
	ID.PLAYER_PROJECTILE_PIERCE_1: 12,
	ID.PLAYER_PROJECTILE_PIERCE_2: 6,
	ID.PLAYER_PROJECTILE_PIERCE_3: 3,
	ID.PLAYER_PROJECTILE_BOUNCE_1: 15,
	ID.PLAYER_PROJECTILE_HOMING: 20,

	ID.ENEMY_PROJECTILE_SPEED_10: 10,
	ID.ENEMY_PROJECTILE_SPEED_10_NEGATIVE: 10,
	ID.ENEMY_PROJECTILE_PIERCE_BUT_FF: 5,
	ID.ENEMY_PROJECTILE_BOUNCE_1: 8,
	ID.ENEMY_PROJECTILE_HOMING: 4,


	# Targeting
	ID.PLAYER_TARGETS_PROJECTILES: 5,
	ID.ENEMY_TARGETS_PROJECTILES: 8,
	ID.ENEMY_TARGETS_ENEMY: 5,
}

const descriptions = {
	# Player-affecting
	ID.PLAYER_SPEED_10: "+10% PLAYER movement speed",
	ID.PLAYER_SPEED_10_NEGATIVE: "-10% PLAYER movement speed",
	ID.PLAYER_SPEED_20: "+20% PLAYER movement speed",
	ID.PLAYER_SPEED_20_NEGATIVE: "-20% PLAYER movement speed",
	ID.PLAYER_SPEED_30: "+30% PLAYER movement speed",
	ID.PLAYER_SPEED_30_NEGATIVE: "-30% PLAYER movement speed",
	ID.PLAYER_DAMAGE_IMMUNE: "PLAYER ignores all damage",
	ID.PLAYER_CRIT_CHANCE_10: "+10% PLAYER crit chance",
	ID.PLAYER_CRIT_CHANCE_20: "+20% PLAYER crit chance",
	ID.PLAYER_CRIT_CHANCE_30: "+30% PLAYER crit chance",


	# Enemy-affecting
	ID.ENEMY_SPEED_10: "+10% ENEMY movement speed",
	ID.ENEMY_SPEED_10_NEGATIVE: "-10% ENEMY movement speed",
	ID.ENEMY_SPEED_20: "+20% ENEMY movement speed",
	ID.ENEMY_SPEED_20_NEGATIVE: "-20% ENEMY movement speed",
	ID.ENEMY_SPEED_30: "+30% ENEMY movement speed",
	ID.ENEMY_SPEED_30_NEGATIVE: "-30% ENEMY movement speed",
	ID.ENEMY_DAMAGE_IMMUNE: "ENEMIES ignore all damage",


	# Projectiles
	ID.PLAYER_PROJECTILE_SPEED_10: "+10% PLAYER projectile speed",
	ID.PLAYER_PROJECTILE_SPEED_10_NEGATIVE: "-10% PLAYER projectile speed",
	ID.PLAYER_PROJECTILE_PIERCE_1: "+1 PLAYER projectile piercing",
	ID.PLAYER_PROJECTILE_PIERCE_2: "+2 PLAYER projectile piercing",
	ID.PLAYER_PROJECTILE_PIERCE_3: "+3 PLAYER projectile piercing",
	ID.PLAYER_PROJECTILE_BOUNCE_1: "+1 PLAYER projectile bounce",
	ID.PLAYER_PROJECTILE_HOMING: "Homing PLAYER projectiles",

	ID.ENEMY_PROJECTILE_SPEED_10: "+10% ENEMY projectile speed",
	ID.ENEMY_PROJECTILE_SPEED_10_NEGATIVE: "-10% ENEMY projectile speed",
	ID.ENEMY_PROJECTILE_PIERCE_BUT_FF: "ENEMY projectiles pierce other enemies",
	ID.ENEMY_PROJECTILE_BOUNCE_1: "+1 ENEMY projectile bounce",
	ID.ENEMY_PROJECTILE_HOMING: "Homing ENEMY projectiles",


	# Targeting
	ID.PLAYER_TARGETS_PROJECTILES: "PLAYER targets nearest projectile",
	ID.ENEMY_TARGETS_PROJECTILES: "ENEMIES target nearest projectile",
	ID.ENEMY_TARGETS_ENEMY: "ENEMIES target nearest enemy",
}

const _icon_array = {
	"BLOOD": "res://media/blood.png",
	"BOOT": "res://media/boot.png",
	"BOUNCE": "res://media/bounce.png",
	"BULLET": "res://media/bullet.png",
	"CRIT": "res://media/crit.png",
	"FIRE_RATE": "res://media/fire_rate.png",
	"HOMING": "res://media/HOMING.png",
	"PIERCE": "res://media/pierce.png",
	"PROJ_SPEED": "res://media/proj_speed.png",
	"SHIELD": "res://media/shield.png",
	"TARGET": "res://media/target.png",
}

const icons = {
	# Player-affecting
	ID.PLAYER_SPEED_10: _icon_array["BOOT"],
	ID.PLAYER_SPEED_10_NEGATIVE: _icon_array["BOOT"],
	ID.PLAYER_SPEED_20: _icon_array["BOOT"],
	ID.PLAYER_SPEED_20_NEGATIVE: _icon_array["BOOT"],
	ID.PLAYER_SPEED_30: _icon_array["BOOT"],
	ID.PLAYER_SPEED_30_NEGATIVE: _icon_array["BOOT"],
	ID.PLAYER_DAMAGE_IMMUNE: _icon_array["SHIELD"],
	ID.PLAYER_CRIT_CHANCE_10: _icon_array["CRIT"],
	ID.PLAYER_CRIT_CHANCE_20: _icon_array["CRIT"],
	ID.PLAYER_CRIT_CHANCE_30: _icon_array["CRIT"],


	# Enemy-affecting
	ID.ENEMY_SPEED_10: _icon_array["BOOT"],
	ID.ENEMY_SPEED_10_NEGATIVE: _icon_array["BOOT"],
	ID.ENEMY_SPEED_20: _icon_array["BOOT"],
	ID.ENEMY_SPEED_20_NEGATIVE: _icon_array["BOOT"],
	ID.ENEMY_SPEED_30: _icon_array["BOOT"],
	ID.ENEMY_SPEED_30_NEGATIVE: _icon_array["BOOT"],
	ID.ENEMY_DAMAGE_IMMUNE: _icon_array["SHIELD"],


	# Projectiles
	ID.PLAYER_PROJECTILE_SPEED_10: _icon_array["PROJ_SPEED"],
	ID.PLAYER_PROJECTILE_SPEED_10_NEGATIVE: _icon_array["PROJ_SPEED"],
	ID.PLAYER_PROJECTILE_PIERCE_1: _icon_array["PIERCE"],
	ID.PLAYER_PROJECTILE_PIERCE_2: _icon_array["PIERCE"],
	ID.PLAYER_PROJECTILE_PIERCE_3: _icon_array["PIERCE"],
	ID.PLAYER_PROJECTILE_BOUNCE_1: _icon_array["BOUNCE"],
	ID.PLAYER_PROJECTILE_HOMING: _icon_array["HOMING"],

	ID.ENEMY_PROJECTILE_SPEED_10: _icon_array["PROJ_SPEED"],
	ID.ENEMY_PROJECTILE_SPEED_10_NEGATIVE: _icon_array["PROJ_SPEED"],
	ID.ENEMY_PROJECTILE_PIERCE_BUT_FF: _icon_array["PIERCE"],
	ID.ENEMY_PROJECTILE_BOUNCE_1: _icon_array["BOUNCE"],
	ID.ENEMY_PROJECTILE_HOMING: _icon_array["HOMING"],


	# Targeting
	ID.PLAYER_TARGETS_PROJECTILES: _icon_array["TARGET"],
	ID.ENEMY_TARGETS_PROJECTILES: _icon_array["TARGET"],
	ID.ENEMY_TARGETS_ENEMY: _icon_array["TARGET"],
}

# information signals
signal card_activation_changed(id: Card.ID, active: bool)

# control signals
signal player_speed_modified(percentage_increase)

@export var card_id = ID.PLAYER_SPEED_10

var lower_bound: int
var upper_bound: int
var is_active: bool = false

static func get_random_card_id():
	return randi() % ID.size()

static func no_more_allowed(card_id):
	# TODO: count nodes in group
	var count_in_play = 0
	var allowed = 1
	if card_id in allowed_count.keys():
		allowed = allowed_count[card_id]
	if count_in_play < allowed:
		return false
	return true

static func create_from_id(card_id: Card.ID):
	var output = preload("res://scenes/cards/card.tscn").instantiate()
	output.card_id = card_id
	output.prepare()
	# it helps if you make it return. Code at normal hours, folks
	return output

func prepare():
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
