@tool
extends Button


func _enter_tree() -> void:
	pressed.connect(clicked)


func clicked():
	print("you clicked me, a Button!")
