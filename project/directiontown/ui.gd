extends CanvasLayer

#Takes the time left on the Timer and converts to a string to be assigned to the countdown space.
@onready var countdown = var_to_str(int($Timer.time_left))

#I want this physics process to update the countdown timer each second with the time left.
func _process(delta: float) -> void:
	update_timer(delta)


func update_timer(delta):
	$Countdown/CountdownText.text = countdown
	countdown = var_to_str(int($Timer.time_left - delta))

func update_destination(location):
	$Destination/DestinationText.text = location
