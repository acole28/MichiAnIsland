extends Control

#var game_scene = preload("res://game.tscn").instantiate()
#var main_menu = preload("res://main_menu.tscn").instantiate()

func _ready():
	update_text()

func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
	
func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

func update_text():
	$Panel/VBoxContainer/Congrats.add_text("Congratulations!")
	$Panel/VBoxContainer/Congrats.add_text("\nYou did it in " + Global.final_time + " seconds!")
	
