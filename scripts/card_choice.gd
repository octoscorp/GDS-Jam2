extends Control

signal card_choice_triggered

var cards: Array

func _ready():
	# I don't trust myself to prototype this efficiently
	var thread = Thread.new()
	thread.start(choose_3_cards)

func choose_3_cards():
	cards = []
	var i = 0
	while cards.size() < 3 and i < 30:
		print("Attempt to pull card")
		i += 1
		var card_id = Card.get_random_card_id()
		if (Card.no_more_allowed(card_id)):
			continue
		print("Added %d" % card_id)
		cards.append(Card.create_from_id(card_id))
	call_deferred("display_card_options")

func display_card_options():
	# TODO: requires handling fewer available options
	print(cards)
	$HBoxContainer/CardOption1.set_card(cards[0])
	$HBoxContainer/CardOption2.set_card(cards[1])
	$HBoxContainer/CardOption3.set_card(cards[2])

	# Should pause the game and allow selection of card
	card_choice_triggered.emit()
	self.visible = true

func _on_card_option_card_option_selected():
	# TODO: Add card to selected roster
	pass
