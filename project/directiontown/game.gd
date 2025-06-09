extends Node2D

#creates an array of places from the map scene building tab
@onready var goals = $map_holder/Map/Buildings/Places.get_children()
var game_over = preload("res://pause_menu.tscn").instantiate()
var goal 
var found_places := []
var destination : int 
var total_time : int = 0


func _ready():
	reset()
	print(Global.test_num)

	
func make_goal():
	print(goals.size() - 1)
	destination = randi_range(0, goals.size() - 1)
	print(destination)
	#use the random interger to pick the location and activate the collision shape
	#goal = %Map.get_child(2).get_child(0).get_child(destination)
	goal = goals[destination]
	goal.set_deferred("disabled", false)
	print(goal.get_name())
	$Player/UserInterface.update_destination(goal.locationName)
	
		
func clear_goal():
	var i = 0
	var places = %Map.get_child(3).get_child(0).get_children()
	for place in places:
		place.disabled = true
		i += 1


func _on_places_body_entered(body: Node2D) -> void:
	goal.set_deferred("disabled", true)
	var location = goals.pop_at(destination)
	found_places.append(location)
	#print(found_places)
	reset()
	
func reset():
	goal = null
	#Check if there are objects in Goals array. If there are no items, print a message
	if found_places.size() == 2:
		print("you did it!")
		Global.final_time = str(total_time)
		get_tree().change_scene_to_file("res://game_over.tscn")
		#print(Global.final_time)
		$".".queue_free()
	#If there are items, run the setup.
	else:
		clear_goal()
		make_goal()
		
func hide_place_names():
	var places = $MapHolder/Map/Buildings/Places.get_children()
	for place in places:
		place.get_child(0).visible = false
		

func _on_timer_timeout() -> void:
	total_time += 1
	
