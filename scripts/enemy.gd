extends Area2D

signal enemy_died(death_location: Vector2)

@export var MVMT_SPEED_MODIFIER = 1
## How quickly the enemy changes targets following player movement
@export var ENEMY_REACTION_SPEED = 0.06

@export var health = 20

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
	global_position += (targeted_position - global_position).normalized() * Glob.ENEMY_MVMT_SPEED * MVMT_SPEED_MODIFIER * delta

func contains(area: Area2D):
	return (area == $".")

func destroy():
	# TODO: Play animation first
	enemy_died.emit(position)
	self.queue_free()

func take_damage():
	self.health -= 10
	if self.health <= 0:
		self.destroy()
	else:
		# TODO: animation player being added anyway, animate this
		self.modulate = Color(1, 0, 0, 0.27)
		await get_tree().create_timer(0.1).timeout
		self.modulate = Color(1, 1, 1, 1)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("hurts_enemy"):
		take_damage()
