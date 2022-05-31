extends Control


var data : Dictionary
var codigos : Array
onready var popup : = get_node("Popup") as Control
onready var card : = get_node("Popup/Card") as TextureRect

var page : = 0
var pages

var disciplina1 : Disciplina = Disciplina.new()
var disciplina2 : Disciplina = Disciplina.new()
var disciplina3 : Disciplina = Disciplina.new()
var disciplina4 : Disciplina = Disciplina.new()
var disciplina5 : Disciplina = Disciplina.new()
var disciplina6 : Disciplina = Disciplina.new()


func load_codigos(disciplinas):
	for i in disciplinas:
		codigos.append(i)


func show_disciplinas():
	$Disciplina1.show()
	$Disciplina2.show()
	$Disciplina3.show()
	$Disciplina4.show()
	$Disciplina5.show()
	$Disciplina6.show()

func hide_disciplinas(qtd):
	var to_hide : Array = []
	if(qtd < 6):
		for j in range(qtd+1, 7):
			to_hide.append(j)
	
	for i in to_hide:
		match (i):
			1:
				$Disciplina1.hide()
			2:
				$Disciplina2.hide()
			3:
				$Disciplina3.hide()
			4:
				$Disciplina4.hide()
			5:
				$Disciplina5.hide()
			6:
				$Disciplina6.hide()


func load_label(pos): #Puxa o nome de cada disciplina (for) e aplica nas labels
	var nome = data[codigos[pos]]["nome"]
	match (pos % 6):
		0: 
			$Disciplina1/Label.text = nome
		1:
			$Disciplina2/Label.text = nome
		2:
			$Disciplina3/Label.text = nome
		3:
			$Disciplina4/Label.text = nome
		4:
			$Disciplina5/Label.text = nome
		5:
			$Disciplina6/Label.text = nome


func load_objetos(pos):
	match (pos % 6):
		0:
			disciplina1.load_values(data[codigos[6 * page]], codigos[6 * page])
		1:
			disciplina2.load_values(data[codigos[6 * page + 1]], codigos[6 * page + 1])
		2:
			disciplina3.load_values(data[codigos[6 * page + 2]], codigos[6 * page + 2])
		3:
			disciplina4.load_values(data[codigos[6 * page + 3]], codigos[6 * page + 3])
		4:
			disciplina5.load_values(data[codigos[6 * page + 4]], codigos[6 * page + 4])
		5:
			disciplina6.load_values(data[codigos[6 * page + 5]], codigos[6 * page + 5])

func load_data(data):
	if(page < pages):
		for i in range((6 * page), (6 * (page + 1))):
			load_objetos(i)
			load_label(i)
	else:
		for i in range((6 * page), len(data)):
			load_objetos(i)
			load_label(i)
		hide_disciplinas(len(data) % 6)


func load_disciplinas():
	data = global.data_disciplinas[global.semestre]
	pages = int(len(data) / 6.0)
	if(pages > 0):
		$Seguinte.show()
	show_disciplinas()
	load_codigos(data)
	load_data(data)
	

func _ready():
	$Semestre.text = str(global.semestre) + " Semestre"
	load_disciplinas()


func _on_Disciplina1_button_up():
	Audio.get_node("Botoes").play()
	disciplina1.load_popup(popup, card)


func _on_Disciplina2_button_up():
	Audio.get_node("Botoes").play()
	disciplina2.load_popup(popup, card)


func _on_Disciplina3_button_up():
	Audio.get_node("Botoes").play()
	disciplina3.load_popup(popup, card)


func _on_Disciplina4_button_up():
	Audio.get_node("Botoes").play()
	disciplina4.load_popup(popup, card)


func _on_Disciplina5_button_up():
	Audio.get_node("Botoes").play()
	disciplina5.load_popup(popup, card)


func _on_Disciplina6_button_up():
	Audio.get_node("Botoes").play()
	disciplina6.load_popup(popup, card)


func _on_Button_pressed():
	popup.hide()


func _on_Seguinte_button_up():
	Audio.get_node("Botoes").play()
	page += 1
	show_disciplinas()
	load_data(data)
	if(page >= pages):
		page = pages
		$Seguinte.hide()
	


func _on_Anterior_button_up():
	Audio.get_node("Botoes").play()
	if(page == 0):
		get_node("/root/global").goto_scene("res://Cenas/Semestres.tscn")
	else:
		page -= 1
		show_disciplinas()
		load_data(data)
	if(page <= 0):
		page = 0
	if(page < pages):
		$Seguinte.show()


func _on_Fechar_button_up():
	popup.hide()
