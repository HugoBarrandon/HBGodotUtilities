extends Control

var is_active: bool = false
var cheatWords: Dictionary
var currentWord : String = ""
var specialKey : int = KEY_CONTROL
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func addCheatword(word : String, function : FuncRef):
	cheatWords[word] = function

func _process(_delta):
	if Input.is_key_pressed(specialKey):
		is_active = true
	else:
		is_active=false
		currentWord=""
			
func _input(event):
	if event is InputEventKey and is_active:
		if event.scancode != specialKey and Input.is_key_pressed(event.scancode):
			currentWord += OS.get_scancode_string(event.scancode)
			for w in cheatWords.keys():
				if w.to_upper() in currentWord:
					cheatWords[w].call_func()
					currentWord=""
