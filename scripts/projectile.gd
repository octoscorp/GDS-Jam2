extends Area2D

const PROJ_MVMT_SPEED = 40

var fired_from = null
var actual_position: Vector2
var movement_direction = Vector2(1, 0)
var pierce = 0

func _ready():
	if self.fired_from == null:
		print("Warning: projectile added to scene tree before owner set")
	self.actual_position = self.global_position

func _physics_process(delta: float) -> void:
	actual_position += PROJ_MVMT_SPEED * delta * movement_direction
	global_position = actual_position.round()

func fire_at(target: Area2D):
	# Defaults - hurts player, not enemy
	if self.fired_from.has_method("is_a_player"):
		self.remove_from_group("hurts_player")
		self.add_to_group("hurts_enemy")
	movement_direction = global_position.direction_to(target.global_position).normalized()

func _on_area_entered(area: Area2D) -> void:
	if self.fired_from.contains(area):
		return
	print(area.to_string())
	print(self.fired_from.to_string())
	print()
	pierce -= 1
	if pierce < 0:
		self.queue_free()
