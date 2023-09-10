@tool
extends EditorPlugin

## https://docs.godotengine.org/en/4.1/tutorials/plugins/editor/making_plugins.html

# Replace this value with a PascalCase autoload name, as per the GDScript style guide.
const AUTOLOAD_NAME = "MyCustomAutoload"

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	# The autoload can be a scene or script file.
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/my_custom_autoload/my_custom_autoload.gd")


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	# Remove the autoload when the plugin is disabled/removed.
	remove_autoload_singleton(AUTOLOAD_NAME)
