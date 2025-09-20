extends Area2D

const CARD_CHOICE = preload("res://scenes/card_choice.tscn")

func _ready():
	# TODO: play spawning animation
	pass

func _on_area_entered(area: Area2D) -> void:
	if not area.is_in_group("triggers_chest"):
		return
	# TODO: Pickup animation
	var choice = CARD_CHOICE.instantiate()
	get_tree().get_first_node_in_group("HUD_Root").call_deferred("add_child", choice)
	self.call_deferred("queue_free")
