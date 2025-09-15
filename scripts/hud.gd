extends Control

@onready var luck_text: RichTextLabel = $Luck/Text

func display_luck_value(value: int):
	luck_text.text = "%02d" % value
