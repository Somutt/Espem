extends Control

var old_size = OS.window_size
var old_position = OS.window_position

func _ready():
	$Volume.value = global.volume
	if(OS.window_fullscreen == true):
		$"Tela Cheia".pressed = true
	else:
		$Janela.pressed = true

func _on_HSlider_value_changed(value):
	global.volume = int(value)
	if(global.volume > 2):
		for child in Audio.get_children():
			if(child != Audio.get_node("Botoes")):
				child.set_volume_db(-50 + global.volume / 2)


func _on_Tela_Cheia_toggled(pressed):
	if(pressed):
		$Janela.pressed = false
	else:
		$Janela.pressed = true
		_on_Janela_toggled(true)


func _on_Janela_toggled(pressed):
	if(pressed):
		$"Tela Cheia".pressed = false
	else:
		$"Tela Cheia".pressed = true
		_on_Tela_Cheia_toggled(true)


func _on_Salvar_pressed():
	var path : = Array(str(global.last_scene).split("/"))
	var scene = path.back()
	if(path.has("Dialogo") or path.has("Inicio") or path.has("Jogar")):
		scene = "Novel/" + scene
	if(scene.find(".tscn") == -1):
		scene = scene + ".tscn"
	get_node("/root/global").goto_scene("res://Cenas/"+scene)
