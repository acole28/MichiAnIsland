extends CanvasLayer

#Takes the time left on the Timer and converts to a string to be assigned to the countdown space.
@onready var countdown = var_to_str(int($Timer.time_left))

#I want this physics process to update the countdown timer each second with the time left.
func _process(delta: float) -> void:
	update_timer(delta)


func update_timer(delta):
	if Global.quiz_game == false:
		$Countdown/CountdownText.text = countdown
		countdown = var_to_str(int($Timer.time_left - delta))
	else:
		$Countdown.visible = false

func update_destination(location):
	if Global.quiz_game == false:
		$Destination/DestinationText.text = location
	else:
		$Destination/DestinationText.text = location
