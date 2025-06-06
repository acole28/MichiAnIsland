extends Node2D

@onready var camera = $Player/Camera2D
@onready var places = %Map.get_child(4).get_child(0).get_children()

func _ready():
	show_place_names()
	camera.set_zoom(Vector2(.4, .4))
	$Player.max_speed = 200
	$Player/UserInterface.visible = false
	
#this function reveals the panels and text with the location names in the map file
func show_place_names():
	#var places = %Map.get_child(4).get_child(0).get_children()
	for place in places:
		place.get_child(0).visible = true
		place.scale = Vector2(2, 2)

#This function zooms in the camera when the UI button is pressed
func _on_zoom_in_pressed() -> void:
	if camera.get_zoom() < Vector2(2, 2):
		camera.zoom += Vector2(.2, .2)
		$Player.max_speed += 100
		scale_place_names(Vector2(-.2, -.2))

#This button zooms out the camera when the UI button is pressed
func _on_zoom_out_pressed() -> void:
	if camera.get_zoom() > Vector2(.5, .5):
		camera.zoom -= Vector2(.2, .2)
		$Player.max_speed -= 100
		scale_place_names(Vector2(.2, .2))
		print(camera.get_zoom())
		
#This function scales place names/panels with the camera zoom
func scale_place_names(Vector2):
	for place in places:
		place.get_child(0).visible = true
		place.scale += Vector2
