extends TextureRect
class_name Background_Dialogo

#Coleta a imagem de um caminho e a aplica ao node
func setBackground(bg_node, src : String = "escuro.png"):
	bg_node.set_texture(load("res://Imagens/Backgrounds/Novel/"+src))