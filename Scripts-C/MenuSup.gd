extends Control

func _ready():
	add_constant_override("separation", 30)

func _on_Home_pressed():
	global.clear_var()
	get_node("/root/global").goto_scene("res://Cenas/MenuI.tscn")


func _on_Mute_button_up():
	if(global.sound == true):
		$Mute.set_normal_texture(load("res://Imagens/Botoes/sem som.png"))
		$Mute.set_hover_texture(load("res://Imagens/Botoes/sem som_h.png"))
		$Mute.set_pressed_texture(load("res://Imagens/Botoes/sem som_c.png"))
		global.sound = false
	else:
		$Mute.set_normal_texture(load("res://Imagens/Botoes/som.png"))
		$Mute.set_hover_texture(load("res://Imagens/Botoes/som_h.png"))
		$Mute.set_pressed_texture(load("res://Imagens/Botoes/som_c.png"))
		global.sound = true


func _on_Sair_button_up():
	get_tree().quit()


func _on_Opc_pressed():
	global.last_scene = get_parent().get_path()
	get_node("/root/global").goto_scene("res://Cenas/Opcoes.tscn")
