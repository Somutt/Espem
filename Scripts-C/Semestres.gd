extends Control

const FILE_PATH = "res://Data/disciplinas.json"

func load_data() -> Dictionary:
	var file = File.new()
	assert (file.file_exists(FILE_PATH))
	
	file.open(FILE_PATH, file.READ)
	var data = parse_json(file.get_as_text())
	assert (data.size() > 0)
	return data

func _ready():
	global.data_disciplinas = load_data()


func _on_Semestre1_pressed():
	global.semestre = "1"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre2_pressed():
	global.semestre = "2"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre3_pressed():
	global.semestre = "3"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre4_pressed():
	global.semestre = "4"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre5_pressed():
	global.semestre = "5"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre6_pressed():
	global.semestre = "6"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre7_pressed():
	global.semestre = "7"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre8_pressed():
	global.semestre = "8"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre9_pressed():
	global.semestre = "9"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Semestre10_pressed():
	global.semestre = "10"
	get_node("/root/global").goto_scene("res://Cenas/Disciplinas.tscn")
	Audio.get_node("Botoes").play()


func _on_Anterior_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/Menu2.tscn")
