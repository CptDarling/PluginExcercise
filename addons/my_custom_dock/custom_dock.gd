@tool
extends EditorPlugin

## https://docs.godotengine.org/en/4.1/tutorials/plugins/editor/making_plugins.html

# A class member to hold the dock during the plugin life cycle.
var dock


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	# Load the doc scene and instantiate it.
	dock = preload("res://addons/my_custom_dock/my_dock.tscn").instantiate()

	# Add the loaded scene to the docks.
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock.

	dock.pressed.connect(clicked)


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	# Remove the dock.
	remove_control_from_docks(dock)
	# Erase the dock from memory.
	dock.free()


func clicked() -> void:
	print("You clicked me, a docked custom control!")
