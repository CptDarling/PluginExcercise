@tool
extends EditorPlugin

## https://docs.godotengine.org/en/4.1/tutorials/plugins/editor/making_main_screen_plugins.html
## See example plugin demos: https://github.com/godotengine/godot-demo-projects/tree/master/plugins

const MainPanel = preload("res://addons/main_screen/main_panel.tscn")

var main_panel


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	main_panel = MainPanel.instantiate()
	# Add the main panel to the editor's main viewport.
	get_editor_interface().get_editor_main_screen().add_child(main_panel)
	# Hide the main panel. Very much required.
	_make_visible(false)


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	if main_panel:
		main_panel.queue_free()


func _has_main_screen() -> bool:
	return true


func _make_visible(visible: bool) -> void:
	if main_panel:
		main_panel.visible = visible


# If your plugin doesn't handle any node types, you can remove this method.
func _handles(object: Object) -> bool:
	var resp: bool = is_instance_of(object, preload("res://addons/my_custom_node/my_button.gd"))
	print(object, resp)
	return resp


func _get_plugin_name() -> String:
	return "Main Screen Plugin"


func _get_plugin_icon() -> Texture2D:
	return get_editor_interface().get_base_control().get_theme_icon("Node", "EditorIcons")
