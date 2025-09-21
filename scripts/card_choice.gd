extends Control

signal card_choice_triggered
signal card_choice_made

var cards: Array
var selected_card = null

func _ready():
	# I don't trust myself to prototype this efficiently
	var thread = Thread.new()
	thread.start(choose_3_cards)
	selected_card = null
	
	var level = get_tree().get_first_node_in_group("is_level")
	if level == null:
		return
	connect("card_choice_triggered", level.on_card_choice_start)
	connect("card_choice_made", level.on_card_choice_end)
	thread.wait_to_finish()

func no_more_allowed(id_to_use):
	# TODO: count nodes in group
	var count_in_play = 0
	for card in get_tree().get_nodes_in_group("is_card"):
		if card.card_id == id_to_use:
			count_in_play += 1
	var allowed = 1
	if id_to_use in Card.allowed_count.keys():
		allowed = Card.allowed_count[id_to_use]
	if count_in_play < allowed:
		return false
	return true

func choose_3_cards():
	cards = []
	var i = 0
	while cards.size() < 3 and i < 30:
		i += 1
		var card_id = Card.get_random_card_id()
		if (no_more_allowed(card_id)):
			continue
		cards.append(Card.create_from_id(card_id))
	call_deferred("display_card_options")

func display_card_options():
	# TODO: requires handling fewer available options
	$HBoxContainer/CardOption1.set_card(cards[0])
	$HBoxContainer/CardOption2.set_card(cards[1])
	$HBoxContainer/CardOption3.set_card(cards[2])

	# Should pause the game and allow selection of card
	card_choice_triggered.emit()
	self.visible = true

func _on_card_option_card_option_selected(selected_choice: int):
	# TODO: Add card to selected roster
	selected_card = cards[selected_choice]
	card_choice_made.emit()

func choice_made_callback():
	return selected_card
