extends Control

func setup(user: String, score: int):
	$Name.text = user
	$Score.text = "%d" % score
