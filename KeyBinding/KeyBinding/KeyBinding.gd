extends Control

var can_change_key = false
var action_string
var AvoidActionBegin : Array = ["ui_"]

func _ready():
	setKey()
func addAvoidActionBegin(begin : String):
	AvoidActionBegin.append(begin)

func setKey():
	var avoid : bool
	delete_children($Panel/ScrollContainer/Grid)
	for i in InputMap.get_actions():
		avoid = false
		for j in AvoidActionBegin:
			if i.begins_with(j):
				avoid = true
		
		if not avoid:
			var keyLine = preload("res://KeyBinding/KeyLine.tscn").instance()
			keyLine.name = "keyLine"+i
			var EventList = InputMap.get_action_list(i)
			if EventList.empty():
				keyLine.setKeyLine(i,"")
			else:
				keyLine.setKeyLine(i,OS.get_scancode_string(InputMap.get_action_list(i)[0].scancode as int))
			$Panel/ScrollContainer/Grid.add_child(keyLine)

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func _mark_button(string):
	can_change_key = true
	action_string = string
	
	for j in InputMap.get_actions():
		if j != string and not j.begins_with("ui_"):
			get_node("Panel/ScrollContainer/Grid/keyLine" + str(j)).set_pressed(false)

func _input(event):
	if event is InputEventKey: 
		if can_change_key:
			_change_key(event)
			can_change_key = false

func _change_key(new_key):
	#Delete key of pressed button
	if !InputMap.get_action_list(action_string).empty():
		InputMap.action_erase_event(action_string, InputMap.get_action_list(action_string)[0])
	
	#Check if new key was assigned somewhere
	for i in InputMap.get_actions():
		if not i.begins_with("ui_"):
			InputMap.action_erase_event(i, new_key)
			
	#Add new Key
	InputMap.action_add_event(action_string, new_key)
	setKey()
