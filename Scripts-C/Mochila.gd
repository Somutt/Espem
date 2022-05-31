extends Control

class_name Mochila

var is_showing : bool = false
var item_slots : = []

func _ready():
	$Fundo_c.hide()
	$Popup.hide()

func clear_itens():
	for i in range(len(item_slots)):
		item_slots[i].texture = null

func load_itens():
	if(len(item_slots) > 0):
		clear_itens()
		for i in range(len(global.itens_coletados)):
			match (global.itens_coletados[i]):
				"cartaz":
					item_slots[i].set_texture(load("res://Imagens/Objetos/Detetive/Miniaturas/Cartaz.png"))
				"dream":
					item_slots[i].set_texture(load("res://Imagens/Objetos/Detetive/Miniaturas/DreamCatcher.png"))
				"frase":
					item_slots[i].set_texture(load("res://Imagens/Objetos/Detetive/Miniaturas/frase.png"))
				"livro":
					item_slots[i].set_texture(load("res://Imagens/Objetos/Detetive/Miniaturas/Livro.png"))
				"trofeu":
					item_slots[i].set_texture(load("res://Imagens/Objetos/Detetive/Miniaturas/Trofeu.png"))

func _on_Mochila_pressed():
	Audio.get_node("Botoes").play()
	if(is_showing == true):
		$Fundo_c.hide()
		$Popup.hide()
		is_showing = false
	else:
		$Fundo_c.show()
		$Popup.show()
		is_showing = true
		load_itens()
