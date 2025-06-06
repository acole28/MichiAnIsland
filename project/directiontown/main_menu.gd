extends Control

var game_scene = preload("res://game.tscn").instantiate()
var map_scene = preload("res://interactive_map.tscn").instantiate()


func _on_play_game_pressed() -> void:
	get_tree().root.add_child(game_scene)


func _on_texture_button_pressed() -> void:
	get_tree().root.add_child(map_scene)
