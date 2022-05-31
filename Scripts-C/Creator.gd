extends Control

func _ready():
	global.cabelo = "res://Imagens/Objetos/Criacao/cabelo1.png"
	global.blusa = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/blusa v idle.png"
	global.pele = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/tom 1.png"
	global.calca = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/calça.png"

func _on_Crespo_pressed():
	Audio.get_node("Botoes").play()
	$Player/Cabelo2.set_texture(load("res://Imagens/Objetos/Criacao/cabelo1.png"))
	global.cabelo = "res://Imagens/Objetos/Criacao/cabelo1.png"

func _on_Curto_pressed():
	Audio.get_node("Botoes").play()
	$Player/Cabelo2.set_texture(load("res://Imagens/Objetos/Criacao/cabelo2.png"))
	global.cabelo = "res://Imagens/Objetos/Criacao/cabelo2.png"

func _on_QP_pressed():
	Audio.get_node("Botoes").play()
	$Player/Cabelo2.set_texture(load("res://Imagens/Objetos/Criacao/cabelo3.png"))
	global.cabelo = "res://Imagens/Objetos/Criacao/cabelo3.png"


func _on_BlusaGay_pressed():
	Audio.get_node("Botoes").play()
	$Player/Roupa2.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/blusa v idle.png"))
	global.blusa = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/blusa v idle.png"

func _on_BlusaGrande_pressed():
	Audio.get_node("Botoes").play()
	$Player/Roupa2.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/blusa.png"))
	global.blusa = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/blusa.png"

func _on_Regata_pressed():
	Audio.get_node("Botoes").play()
	$Player/Roupa2.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/regata.png"))
	global.blusa = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/regata.png"

func _on_TomPele1_pressed():
	Audio.get_node("Botoes").play()
	$Player.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/tom 2.png"))
	global.pele = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/tom 2.png"

func _on_TomPele2_pressed():
	Audio.get_node("Botoes").play()
	$Player.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/tom 3.png"))
	global.pele = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/tom 3.png"

func _on_TomPele3_pressed():
	Audio.get_node("Botoes").play()
	$Player.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/tom 1.png"))
	global.pele = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/tom 1.png"


func _on_Calca_pressed():
	Audio.get_node("Botoes").play()
	$Player/Calca.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/calça.png"))
	global.calca = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/calça.png"

func _on_Short_pressed():
	Audio.get_node("Botoes").play()
	$Player/Calca.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/jeans.png"))
	global.calca = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/jeans.png"

func _on_Calcao_pressed():
	Audio.get_node("Botoes").play()
	$Player/Calca.set_texture(load("res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/short.png"))
	global.calca = "res://Imagens/Objetos/Criacao/CriacaoNovas/novas imagens/short.png"


func _on_Button_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/Novel/Inicio.tscn")


func _on_Voltar_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/Menu2.tscn")


func _on_LineEdit_text_changed(new_text):
	global.nome = new_text
