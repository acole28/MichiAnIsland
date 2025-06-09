extends Label

func _ready():
	$".".text = get_parent().locationName
