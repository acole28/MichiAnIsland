extends Button

var game_scene = preload("res://game.tscn").instantiate()

func _on_pressed() -> void:
	get_tree().root.add_child(game_scene)
