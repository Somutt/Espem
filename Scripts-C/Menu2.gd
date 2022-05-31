extends Control

func _on_Disciplinas_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Semestres.tscn")
	Audio.get_node("Botoes").play()

func _on_Historia_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Creator.tscn")
	Audio.get_node("Botoes").play()

func _on_Jogos_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Detetive1.tscn")
	Audio.get_node("Botoes").play()

func _on_Ajuda_pressed():
	Audio.get_node("Botoes").play()
	$TelaAjuda.popup()

func _on_Fechar_pressed():
	$TelaAjuda.hide()
