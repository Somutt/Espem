extends Control

class_name Inicio

func _on_Seguinte_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Novel/Dialogo.tscn")
