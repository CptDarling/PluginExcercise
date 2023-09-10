@tool
extends EditorPlugin

## https://docs.godotengine.org/en/4.1/tutorials/plugins/editor/making_plugins.html

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	# Add the new type with a name, a parent type, a script and an icon.
	add_custom_type("MyButton", "Button", preload("res://addons/my_custom_node/my_button.gd"), preload("res://addons/my_custom_node/icon.svg"))


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	# Always remember to remove it from the engine when deactivated.
	remove_custom_type("MyButton")
