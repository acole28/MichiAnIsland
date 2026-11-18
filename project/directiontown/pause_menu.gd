extends CanvasLayer

#var main_menu = preload("res://main_menu.tscn").instantiate()
#var game_scene = ("res://game.tscn")


func _on_play_again_pressed() -> void:
	get_tree().paused = false
	visible = false
	

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_parent().get_parent().queue_free()
	get_tree().change_scene_to_file("res://main_menu.tscn")

	


func _on_touch_controls_toggled(toggled_on: bool) -> void:
	if $Panel/TouchControls.button_pressed == true:
		Global.touch = true
		$"../Camera2D/TouchControls".visible = true
	else:
		Global.touch = false
		$"../Camera2D/TouchControls".visible = false
