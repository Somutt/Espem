extends Control

onready var slots = get_node("Mochila/Popup").get_children()

func _ready():
	$Mochila.item_slots = slots
	if(global.itens_coletados.has("cartaz")):
		$Cartaz.hide()

func _on_Seguinte_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/Detetive2.tscn")

func _on_Button_pressed():
	Audio.get_node("Botoes").play()
	if(global.novel_completa == true):
		get_node("/root/global").goto_scene("res://Cenas/Novel/Jogar.tscn")
	else:
		get_node("/root/global").goto_scene("res://Cenas/Menu2.tscn")


func _on_Cartaz_pressed():
	Audio.get_node("Botoes").play()
	$Popup1.popup()
	global.itens_coletados.append("cartaz")
	$Cartaz.hide()

func _on_Fechar_pressed():
	$Popup1.hide()
