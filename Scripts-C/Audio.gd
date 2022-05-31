extends Node

var m
var tocando
var last_sound

func _ready():
	last_sound = global.sound
	if(global.volume > 2):
		for child in Audio.get_children():
			if (child != $Botoes):
				child.set_volume_db(-50 + global.volume / 2)
	sorteia_musica()
	
func _process(delta):
	if(tocando != null):
		if(last_sound != global.sound):
			tocando.set_stream_paused(not global.sound)
			last_sound = global.sound
		

func sorteia_musica():
	randomize()
	m = randi() % 4
	if m == 0:
		tocando = Audio.get_node("BadRomance")
		tocando.play()
	elif m == 1:
		tocando = Audio.get_node("Forrozao")
		tocando.play()
	elif m == 2:
		tocando = Audio.get_node("Toxic")
		tocando.play()
	elif m == 3:
		tocando = Audio.get_node("DISKME")
		tocando.play()

func _on_BadRomance_finished():
	sorteia_musica()

func _on_Forrozao_finished():
	sorteia_musica()

func _on_Toxic_finished():
	sorteia_musica()

func _on_DISKME_finished():
	sorteia_musica()
