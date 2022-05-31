extends Node

class_name LoadDialogo

signal loaded

func load_dialogue(file_path) -> Dictionary:
	var file = File.new()
	assert (file.file_exists(file_path))
	
	file.open(file_path, file.READ)
	var dialogo = parse_json(file.get_as_text())
	assert (dialogo.size() > 0)
	emit_signal("loaded")
	return dialogo
