extends Node2D

#creates an array of places from the map scene building tab
@onready var goals = $map_holder/Map/Buildings/Places.get_children()
var goal 
var found_places := []
var destination : int


func _ready():
	reset()
		
	
func make_goal():
	#print(goals.size() - 1)
	destination = randi_range(0, goals.size() - 1)
	print(destination)
	#use the random interger to pick the location and activate the collision shape
	#goal = %Map.get_child(2).get_child(0).get_child(destination)
	goal = goals[destination]
	goal.set_deferred("disabled", false)
	print(goal.get_name())
	$Player/UserInterface.update_destination(goal.get_name())
	
		
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
	if goals.size() == 0:
		print("There are no more worlds to conquer")
	#If there are items, run the setup.
	else:
		clear_goal()
		make_goal()
