extends Node

var current_scene = null
var last_scene = "res://Cenas/MenuI.tscn"
var novel_completa : bool = false

var cabelo
var blusa
var calca
var pele
var nome : String
var data_disciplinas : Dictionary
var semestre : String
var musica

#Variaveis de incremento para a Novel
var inc : int = 0
var last_inc : int = inc
var rotaAtual = ""
#Variáveis de armazenamento para o jogo
var itens_coletados : = []
#Variáveis de volume da música/som
var sound : bool = true
var volume : int = 50

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1 )

func goto_scene(path):
	call_deferred("_deferred_goto_scene",path)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

#Evita que o jogo e a novel buguem ao se iniciar novamente
func clear_var():
	inc = 0
	last_inc = inc
	rotaAtual = ""
	itens_coletados = []