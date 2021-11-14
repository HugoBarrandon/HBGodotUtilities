extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setKeyLine(name : String, key : String):
	$Name.text = name
	$Key.text = key
	$Key.set_pressed(false)

func set_pressed(press : bool):
	$Key.set_pressed(press)

func _on_Key_pressed():
	$Key.text = ""
	get_parent().get_parent().get_parent().get_parent()._mark_button($Name.text)
