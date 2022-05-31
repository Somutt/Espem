extends Node2D

func _ready():
	$Pele/Cabelo.set_texture(load(global.cabelo))
	$Pele/Blusa.set_texture(load(global.blusa))
	$Pele/Calca.set_texture(load(global.calca))
	$Pele.set_texture(load(global.pele))

func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Creator.tscn")
