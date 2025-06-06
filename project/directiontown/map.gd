extends Node2D


func _on_library_body_entered(body: Node2D) -> void:
	get_tree().quit()
