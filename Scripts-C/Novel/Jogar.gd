extends Control


func _on_Seguinte_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Detetive1.tscn")


func _on_Voltar_pressed():
	get_node("/root/global").goto_scene("res://Cenas/Novel/Dialogo.tscn")
	global.rotaAtual = ""
	global.inc -= 1
