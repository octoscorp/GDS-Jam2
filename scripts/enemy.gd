extends Node2D

@export var ENEMY_MVMT_SPEED = 20
## How quickly the enemy changes targets following player movement
@export var ENEMY_REACTION_SPEED = 0.06

var target = null
var targeted_position = Vector2(0, 0)

func _ready():
	choose_target()

func choose_target():
	var targets = get_tree().get_nodes_in_group("enemy_target")
	if targets.size() > 0:
		targets.shuffle()
		target = targets[0]
		targeted_position = target.global_position

func _physics_process(delta: float) -> void:
	if target == null:
		return
	targeted_position = lerp(targeted_position, target.global_position, ENEMY_REACTION_SPEED)

	# WARNING: May need to round to INT
	global_position += (targeted_position - global_position).normalized() * ENEMY_MVMT_SPEED * delta
