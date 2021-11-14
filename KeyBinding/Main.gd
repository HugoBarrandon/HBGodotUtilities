extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("OpenMenu"):
		$KeyBinding.visible = not $KeyBinding.visible
	if Input.is_action_just_pressed("Jump"):
		print("Jump")
	if Input.is_action_just_pressed("Left"):
		print("Left")
	if Input.is_action_just_pressed("Right"):
		print("Right")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
