extends Control


func _ready():
	pass

func _on_Iniciar_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/Menu2.tscn")
	pass

func _on_Sair_pressed():
	Audio.get_node("Botoes").play()
	$Popup.popup()
#	$Sair.set_disabled(true)
	pass


func _on_Button_pressed():
	Audio.get_node("Botoes").play()
	$Popup.hide()

func _on_Sobre_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/Sobr.tscn")
	pass


func _on_Criao_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Creator.tscn")
	pass


func _on_Jogo_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Detetive1.tscn")


func _on_Button2_pressed():
	get_tree().quit()


func _on_Opcoes_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Opcoes.tscn")
	Audio.get_node("Botoes").play()
