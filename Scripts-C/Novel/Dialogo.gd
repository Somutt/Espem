extends Control

class_name Dialogo

#Variaveis do arquivo de texto
var data : Dictionary
const PATH : String = "res://Data/novel.json"

var bg : Background_Dialogo = Background_Dialogo.new()
var persona : Char = Char.new()

var char_ar : Array
var opt_dial : Array
var routes : Array

func load_scene(line : Dictionary):
	bg.setBackground($Background, line["background"])
	persona.load_chars(line["chars"], char_ar)
	persona.load_text_dial(line["fala"], $TextoDialogo, opt_dial)
	persona.load_text_personagem(line["chars"], $TextoPersonagem)
	
	
func goToRota():
	if(global.rotaAtual == "gtg"):
		global.novel_completa = true
		get_node("/root/global").goto_scene("res://Cenas/Novel/Jogar.tscn")
	while (not data[str(global.inc + 1)]["rota"] == global.rotaAtual):
		if(data[str(global.inc + 1)]["rota"] == ""):
			global.rotaAtual = ""
			break
		global.inc += 1

func goBackRota():
	if(global.rotaAtual == "gtg"):
		get_node("/root/global").goto_scene("res://Cenas/Detetive3.tscn")
	while(not data[str(global.inc + 1)]["rota"] == global.rotaAtual):
		if(data[str(global.inc + 1)]["rota"] == ""):
			if(data[str(global.inc + 1)]["fala"]["type"] == "a"):
				global.inc -= 1
			global.rotaAtual = ""
			break
		global.inc -= 1


func _ready():
	persona.load_personagem(global.nome)
	# Carrega o arquivo JSON
	var loadDictionary : LoadDialogo = LoadDialogo.new()
	data = loadDictionary.load_dialogue(PATH)
	#Listas de nodes
	char_ar = [$Personagens/Area1, $Personagens/Area2, $Personagens/Area3]
	opt_dial = [$Escolhas, $Escolhas/Label1, $Escolhas/Label2]
	# Esconde as opções
	$Escolhas.hide()
	#Instanciacao dos primeiros valores
	load_scene(data[str(global.inc + 1)])


func _process(delta):
	if(not global.inc == global.last_inc):
		if(global.rotaAtual != ""):
			if(global.inc > global.last_inc):
				goToRota()
			else:
				goBackRota()
		load_scene(data[str(global.inc + 1)])
		global.last_inc = global.inc
	#Esconde botão de voltar no início


func _on_Seguinte_button_up():
	if(global.inc + 1 < len(data)):
		if(data[str(global.inc + 2)]["rota"] == "gtg"):
			global.rotaAtual = "gtg"
		global.inc += 1
	else:
		global.clear_var()
		get_node("/root/global").goto_scene("res://Cenas/MenuI.tscn")

func _on_Escolha1_button_up():
	global.rotaAtual = "a"
	routes.append("a")
	_on_Seguinte_button_up()
	$Escolhas.hide()


func _on_Escolha2_button_up():
	global.rotaAtual = "b"
	routes.append("b")
	_on_Seguinte_button_up()
	$Escolhas.hide()