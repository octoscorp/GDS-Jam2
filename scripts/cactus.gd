extends "res://scripts/enemy.gd"

var able_to_move = false

func _ready():
	# TODO: remove assumption that this will always spawn outside range of target (when enemies/projectiles become targets this will not necessarily be true)
	pass

func _physics_process(delta: float) -> void:
	if able_to_move:
		super._physics_process(delta)

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	able_to_move = false

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	able_to_move = true

func _on_range_area_entered(area: Area2D) -> void:
	if area == self.target:
		able_to_move = true

func _on_range_area_exited(area: Area2D) -> void:
	if area == self.target:
		able_to_move = false
