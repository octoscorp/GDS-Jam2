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
	#ID.ENEMY_PROJECTILE_SPEED_10: 2,
	#ID.ENEMY_PROJECTILE_SPEED_10_NEGATIVE: 3,
	
	# Not implemented
	ID.ENEMY_PROJECTILE_SPEED_10: 0,
	ID.ENEMY_PROJECTILE_SPEED_10_NEGATIVE: 0,
	ID.ENEMY_PROJECTILE_PIERCE_BUT_FF: 0,
	ID.ENEMY_PROJECTILE_BOUNCE_1: 0,
	ID.ENEMY_PROJECTILE_HOMING: 0,
	ID.PLAYER_PROJECTILE_HOMING: 0,
	ID.PLAYER_PROJECTILE_BOUNCE_1: 0,
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
	"BLOOD": preload("res://media/icons/blood.png"),
	"BOOT": preload("res://media/icons/boot.png"),
	"BOUNCE": preload("res://media/icons/bounce.png"),
	"BULLET": preload("res://media/icons/bullet.png"),
	"CRIT": preload("res://media/icons/crit.png"),
	"FIRE_RATE": preload("res://media/icons/fire_rate.png"),
	"HOMING": preload("res://media/icons/homing.png"),
	"PIERCE": preload("res://media/icons/pierce.png"),
	"PROJ_SPEED": preload("res://media/icons/proj_speed.png"),
	"SHIELD": preload("res://media/icons/shield.png"),
	"TARGET": preload("res://media/icons/target.png"),
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

@export var card_id = ID.PLAYER_SPEED_10

var lower_bound: int
var upper_bound: int
var is_active: bool = false

static func get_random_card_id():
	return randi() % ID.size()

static func create_from_id(id_to_use: Card.ID):
	var output = preload("res://scenes/cards/card.tscn").instantiate()
	output.card_id = id_to_use
	output.prepare()
	# it helps if you make it return. Code at normal hours, folks
	return output

func prepare():
	var luck_range = chances[card_id]
	lower_bound = randi() % (100 - luck_range)
	upper_bound = lower_bound + luck_range

func activate(current_luck: int):
	var in_range = (current_luck >= lower_bound && current_luck < upper_bound)
	# XOR
	if (not is_active and in_range) or (is_active and not in_range):
		_apply_effect(is_active)
		is_active = not is_active
		card_activation_changed.emit(card_id, is_active)

func mult_value(value: float, invert: bool):
	return (1 / value) if invert else value

func additive_value(value: float, invert: bool):
	return (0 - value) if invert else value

# Applies card effect (removes if remove is true)
func _apply_effect(remove):
	match card_id:
		# Player-affecting
		ID.PLAYER_SPEED_10:
			# WARNING: Does not cancel to 1 with corresponding negative
			Glob.PLAYER_MVMT_SPEED *= mult_value(1.1, remove)
		ID.PLAYER_SPEED_10_NEGATIVE:
			Glob.PLAYER_MVMT_SPEED *= mult_value(0.9, remove)
		ID.PLAYER_SPEED_20:
			Glob.PLAYER_MVMT_SPEED *= mult_value(1.2, remove)
		ID.PLAYER_SPEED_20_NEGATIVE:
			Glob.PLAYER_MVMT_SPEED *= mult_value(0.8, remove)
		ID.PLAYER_SPEED_30:
			Glob.PLAYER_MVMT_SPEED *= mult_value(1.3, remove)
		ID.PLAYER_SPEED_30_NEGATIVE:
			Glob.PLAYER_MVMT_SPEED *= mult_value(0.7, remove)
		ID.PLAYER_DAMAGE_IMMUNE:
			Glob.PLAYER_IS_IMMUNE = not remove
		ID.PLAYER_CRIT_CHANCE_10:
			Glob.PLAYER_CRIT_CHANCE *= mult_value(1.1, remove)
		ID.PLAYER_CRIT_CHANCE_20:
			Glob.PLAYER_CRIT_CHANCE *= mult_value(1.2, remove)
		ID.PLAYER_CRIT_CHANCE_30:
			Glob.PLAYER_CRIT_CHANCE *= mult_value(1.3, remove)


		# Enemy-affecting
		ID.ENEMY_SPEED_10:
			Glob.ENEMY_MVMT_SPEED *= mult_value(1.1, remove)
		ID.ENEMY_SPEED_10_NEGATIVE:
			Glob.ENEMY_MVMT_SPEED *= mult_value(0.9, remove)
		ID.ENEMY_SPEED_20:
			Glob.ENEMY_MVMT_SPEED *= mult_value(1.2, remove)
		ID.ENEMY_SPEED_20_NEGATIVE:
			Glob.ENEMY_MVMT_SPEED *= mult_value(0.8, remove)
		ID.ENEMY_SPEED_30:
			Glob.ENEMY_MVMT_SPEED *= mult_value(1.3, remove)
		ID.ENEMY_SPEED_30_NEGATIVE:
			Glob.ENEMY_MVMT_SPEED *= mult_value(0.7, remove)
		ID.ENEMY_DAMAGE_IMMUNE:
			Glob.ENEMY_IS_IMMUNE = not remove


		# Projectiles
		ID.PLAYER_PROJECTILE_SPEED_10:
			Glob.PLAYER_PROJECTILE_SPEED *= mult_value(1.1, remove)
		ID.PLAYER_PROJECTILE_SPEED_10_NEGATIVE:
			Glob.PLAYER_PROJECTILE_SPEED *= mult_value(0.9, remove)
		ID.PLAYER_PROJECTILE_PIERCE_1:
			Glob.PLAYER_PROJECTILE_PIERCE += additive_value(1, remove)
		ID.PLAYER_PROJECTILE_PIERCE_2:
			Glob.PLAYER_PROJECTILE_PIERCE += additive_value(2, remove)
		ID.PLAYER_PROJECTILE_PIERCE_3:
			Glob.PLAYER_PROJECTILE_PIERCE += additive_value(3, remove)
		ID.PLAYER_PROJECTILE_BOUNCE_1:
			Glob.PLAYER_PROJECTILE_BOUNCE += additive_value(1, remove)
		ID.PLAYER_PROJECTILE_HOMING:
			Glob.PLAYER_PROJECTILE_HOMING = not remove

		ID.ENEMY_PROJECTILE_SPEED_10:
			Glob.ENEMY_PROJECTILE_SPEED *= mult_value(1.1, remove)
		ID.ENEMY_PROJECTILE_SPEED_10_NEGATIVE:
			Glob.ENEMY_PROJECTILE_SPEED *= mult_value(0.9, remove)
		ID.ENEMY_PROJECTILE_PIERCE_BUT_FF:
			Glob.ENEMY_PROJECTILE_PIERCE = not remove
		ID.ENEMY_PROJECTILE_BOUNCE_1:
			Glob.ENEMY_PROJECTILE_BOUNCE *= mult_value(1.1, remove)
		ID.ENEMY_PROJECTILE_HOMING:
			Glob.ENEMY_PROJECTILE_HOMING = not remove


		# Targeting
		ID.PLAYER_TARGETS_PROJECTILES:
			Glob.PLAYER_TARGETS_PROJECTILES = not remove
		ID.ENEMY_TARGETS_PROJECTILES:
			Glob.ENEMY_TARGETS_PROJECTILES = not remove
		ID.ENEMY_TARGETS_ENEMY:
			Glob.ENEMY_TARGETS_ENEMY = not remove
