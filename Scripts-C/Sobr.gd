extends Control


func _on_TextureButton_pressed():
	Audio.get_node("Botoes").play()
	get_node("/root/global").goto_scene("res://Cenas/MenuI.tscn")
