extends Area2D

class_name Player

signal pause_game

# "Constants"
const IFRAME_LENGTH = 10
const DAMAGE_DISPLAY_LENGTH = 8
@export var FOLLOW_DELAY = 0.25
@export var FOLLOW_SPEED = 0.02
@export var MVMT_SPEED = 70

var bullet = preload("res://scenes/projectile.tscn")

var time_since_input_start = 0.0
var recv_input = false
var camera = null
var immunity_frames = 0
var fire_rate: float

var areas_in_range = []

func _ready() -> void:
	camera = get_tree().get_nodes_in_group("player_follow_camera")[0]
	set_fire_rate(1.0)

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
	
	# Decrement i-frames
	if immunity_frames > 0:
		immunity_frames -= 1
		if immunity_frames == IFRAME_LENGTH - DAMAGE_DISPLAY_LENGTH:
			self.modulate = Color(1, 1, 1, 1)

func contains(area: Area2D):
	return (area == $"." || area == $Range)

func take_damage():
	immunity_frames = IFRAME_LENGTH
	self.modulate = Color(1, 0, 0, 0.27)

# For use in duck typing (has_method)
func is_a_player():
	pass

func update_range(value: int):
	$Range/Circle.shape.radius = value

func _shoot(target: Area2D):
	if target == null:
		return
	var shot = bullet.instantiate()
	shot.fired_from = self
	shot.global_position = self.global_position
	get_tree().root.add_child(shot)
	shot.fire_at(target)

func fire_at_closest():
	var least_distance = 640
	var closest_target = null
	for area_node in areas_in_range:
		if not area_node.is_in_group("player_targets"):
			continue
		var distance = position.distance_to(area_node.position)
		if distance < least_distance:
			least_distance = distance
			closest_target = area_node

	_shoot(closest_target)

func set_fire_rate(new_rate: float):
	fire_rate = new_rate
	$ShotTimer.wait_time = 1.0 / fire_rate

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("hurts_player"):
		take_damage()

func _on_range_area_entered(area: Area2D) -> void:
	areas_in_range.append(area)

func _on_range_area_exited(area: Area2D) -> void:
	areas_in_range.erase(area)

func _on_shot_timer_timeout() -> void:
	fire_at_closest()
