extends Control

onready var slots = get_node("Mochila/Popup").get_children()

func _ready():
	$Mochila.item_slots = slots
	if(global.itens_coletados.has("frase")):
		$Frase.hide()
	if(global.itens_coletados.has("dream")):
		$DreamCatcher.hide()

func _on_TextureButton_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/Detetive1.tscn")


func _on_Seguinte_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/Detetive3.tscn")


func _on_Frase_pressed():
	$Popup1.popup()
	Audio.get_node("Botoes").play()
	global.itens_coletados.append("frase")
	$Frase.hide()


func _on_DreamCatcher_pressed():
	$Popup2.popup()
	Audio.get_node("Botoes").play()
	global.itens_coletados.append("dream")
	$DreamCatcher.hide()