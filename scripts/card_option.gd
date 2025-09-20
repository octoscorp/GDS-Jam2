extends Control

signal card_option_selected(card_selection: int)

var selected = false
var card: Card = null

func _ready():
	$Outline.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and selected:
		card_option_selected.emit()

func set_card(new_card: Card):
	card = new_card
	var id = card.card_id
	$Description.text = "%d-%d: %s" % [card.lower_bound, card.upper_bound, Card.descriptions[id]]
	$Icon.texture = Card.icons[id]

func _on_hover_detector_mouse_entered() -> void:
	$Outline.visible = true
	selected = true

func _on_hover_detector_mouse_exited() -> void:
	$Outline.visible = false
	selected = false
