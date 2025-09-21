extends Path2D

const PROBABILITY_CHANGE = 0.1
const ENEMIES_BY_DIFFICULTY = [
	preload("res://scenes/cactus.tscn"),
	preload("res://scenes/enemy.tscn"),
]

var probabilities = Array([], TYPE_FLOAT, "", null)
var probs_start = 0
var probs_end = 0
var count = 0

func _ready():
	probabilities.append(1.0)
	for i in range(ENEMIES_BY_DIFFICULTY.size() - 1):
		probabilities.append(0.0)
	if probabilities.size() > 1:
		probs_end = 1

func uptick_difficulty():
	$Timer.wait_time *= 0.99
	if probs_start == probs_end:
		# Can't change probs any more
		return
	probabilities[probs_end] += PROBABILITY_CHANGE
	probabilities[probs_start] -= PROBABILITY_CHANGE
	if probabilities[probs_start] <= 0:
		probs_start += 1
	if (probabilities[probs_end] >= 3 * PROBABILITY_CHANGE) and \
		probs_end < probabilities.size():
		probs_end += 1
		if probs_end >= probabilities.size():
			probs_end -= 1

func spawn():
	var val = randf()
	for i in range(probs_start, probs_end + 1):
		val -= probabilities[i]
		if val < 0:
			var mob = ENEMIES_BY_DIFFICULTY[i].instantiate()
			var mob_spawn_location = $SpawnLocation
			mob_spawn_location.progress_ratio = randf()
			mob.position = mob_spawn_location.global_position
			mob.enemy_died.connect(_on_enemy_died)
			if Glob.ENEMY_TARGETS_ENEMY:
				mob.add_to_group("enemy_targets")
			$"../..".add_child(mob)

func _on_enemy_died(location: Vector2):
	call_deferred("_cb_enemy_died", location)

func _cb_enemy_died(location:Vector2):
	$"../.."._on_enemy_died(location)

# TESTING TODO Make better
func _on_timer_timeout() -> void:
	spawn()
	count += 1
	if count == 100:
		uptick_difficulty()
		count = 0
