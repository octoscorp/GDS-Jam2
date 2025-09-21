extends Control

const SCORE_ENTRY = preload("res://scenes/score_entry.tscn")

func _ready():
	update_scores()

func sort_scores(a, b):
	return a[1] < b[1]

func add_score_entry():
	var name = "Guest"
	if $ScoreEntry/LineEdit.text != "":
		name = $ScoreEntry/LineEdit.text
	Scores.scores.append([name, Scores.current_score])
	update_scores()

func update_scores():
	Scores.scores.sort_custom(sort_scores)
	var top = Scores.scores.size() if Scores.scores.size() < 10 else 10
	for i in range(top):
		var score_ent = Scores.scores[i]
		var score_disp = SCORE_ENTRY.instantiate()
		score_disp.setup(score_ent[0], score_ent[1])
		score_disp.position.y += 25 * i
		$ColorRect.add_child(score_disp)

func _on_button_button_up() -> void:
	add_score_entry()
	$ScoreEntry.hide()

func _on_play_again_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")
