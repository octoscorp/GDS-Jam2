extends Node2D

signal pause_game

# "Constants"
@export var FOLLOW_DELAY = 0.25
@export var FOLLOW_SPEED = 0.02
@export var MVMT_SPEED = 70

var time_since_input_start = 0.0
var recv_input = false
var camera = null

func _ready() -> void:
	camera = get_tree().get_nodes_in_group("player_follow_camera")[0]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		emit_signal("pause_game")

func _physics_process(delta: float) -> void:
	var can_start_delay = (recv_input == false)
	recv_input = false
	
	# Camera movement
	if time_since_input_start > FOLLOW_DELAY:
		camera.position = lerp(camera.position, position, FOLLOW_SPEED)
	else:
		time_since_input_start += delta
	
	# Player Movement
	var input_direction = Vector2(0,0)
	if Input.is_action_pressed("player_up"):
		input_direction += Vector2(0, -1)
		recv_input = true
	if Input.is_action_pressed("player_down"):
		input_direction += Vector2(0, 1)
		recv_input = true
	if Input.is_action_pressed("player_left"):
		input_direction += Vector2(-1, 0)
		recv_input = true
	if Input.is_action_pressed("player_right"):
		input_direction += Vector2(1, 0)
		recv_input = true	
	position += input_direction * MVMT_SPEED * delta

	# Kick off camera movement delay if we just started moving
	if can_start_delay == true && recv_input == true:
		time_since_input_start = 0
