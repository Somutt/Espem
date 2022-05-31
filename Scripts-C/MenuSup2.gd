extends Control


func _ready():
	if(global.sound == true):
		$Mute.set_normal_texture(load("res://Imagens/Botoes/som.png"))
		$Mute.set_hover_texture(load("res://Imagens/Botoes/som_h.png"))
		$Mute.set_pressed_texture(load("res://Imagens/Botoes/som_c.png"))
		global.musica = Audio.tocando.get_playback_position()
	else:
		$Mute.set_normal_texture(load("res://Imagens/Botoes/sem som.png"))
		$Mute.set_hover_texture(load("res://Imagens/Botoes/sem som_h.png"))
		$Mute.set_pressed_texture(load("res://Imagens/Botoes/sem som_c.png"))


func _on_Home_pressed():
	global.clear_var()
	get_node("/root/global").goto_scene("res://Cenas/MenuI.tscn")
	Audio.get_node("Botoes").play()


func _on_Mute_pressed():
	if(global.sound == true):
		$Mute.set_normal_texture(load("res://Imagens/Botoes/sem som.png"))
		$Mute.set_hover_texture(load("res://Imagens/Botoes/sem som_h.png"))
		$Mute.set_pressed_texture(load("res://Imagens/Botoes/sem som_c.png"))
		global.sound = false
		global.musica = Audio.tocando.get_playback_position()
		Audio.tocando.stop()
	else:
		$Mute.set_normal_texture(load("res://Imagens/Botoes/som.png"))
		$Mute.set_hover_texture(load("res://Imagens/Botoes/som_h.png"))
		$Mute.set_pressed_texture(load("res://Imagens/Botoes/som_c.png"))
		global.sound = true
		Audio.tocando.play(global.musica)
	Audio.get_node("Botoes").play()


func _on_Sair_pressed():
	$SairPop.popup()
	Audio.get_node("Botoes").play()

func _on_NAO_pressed():
	$SairPop.hide()
	Audio.get_node("Botoes").play()

func _on_SIM_pressed():
	Audio.get_node("Botoes").play()
	get_tree().quit()

func _on_Opc_pressed():
	Audio.get_node("Botoes").play()
	global.last_scene = get_parent().get_path()
	get_node("/root/global").goto_scene("res://Cenas/Opcoes.tscn")
