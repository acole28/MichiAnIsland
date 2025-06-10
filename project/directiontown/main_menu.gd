extends Control

var game_scene = preload("res://game.tscn").instantiate()
var map_scene = preload("res://interactive_map.tscn").instantiate()


func _ready():
	if Global.quiz_game == true:
		$QuizMode.button_pressed = true
	elif Global.quiz_game == false:
		$QuizMode.button_pressed = false
	if Global.touch == true:
		$TouchControls.button_pressed = true
	elif Global.touch == false:
		$TouchControls.button_pressed = false

func _on_play_game_pressed() -> void:
	queue_free()
	get_tree().root.add_child(game_scene)
	


func _on_texture_button_pressed() -> void:
	get_tree().root.add_child(map_scene)


func _on_check_box_toggled(_toggled_on: bool) -> void:
	if $QuizMode.button_pressed == true:
		Global.quiz_game = true
	else:
		Global.quiz_game = false
	


func _on_touch_controls_toggled(_toggled_on: bool) -> void:
	if $TouchControls.button_pressed == true:
		Global.touch = true
		print(Global.touch)
	else:
		Global.touch = false
		print(Global.touch)
