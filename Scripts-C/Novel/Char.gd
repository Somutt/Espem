extends Node

class_name Char

var personagem

func load_personagem(nome: String):
	self.personagem = nome

func load_names(characters : Dictionary) -> Array:
	var names : = []
	for p in characters:
		names.append(p)
	return names

func load_areas(names, char_areas) -> Array:
	match (len(names)):
		1:
			return [char_areas[1]]
		2:
			return [char_areas[0], char_areas[2]]
		3:
			return [char_areas[0], char_areas[1], char_areas[2]]
		_:
			return []

func load_flags(chars, names) -> Array:
	var flags : = []
	for i in range(len(chars)):
		flags.append(chars[names[i]]["flags"])
	return flags
	
func load_sprite():
	var spr_personagem = Sprite.new()
	var spr_cabelo = Sprite.new()
	var spr_blusa = Sprite.new()
	var spr_calca = Sprite.new()
	
	spr_personagem.set_texture(load(global.pele))
	spr_cabelo.set_texture(load(global.cabelo))
	spr_blusa.set_texture(load(global.blusa))
	spr_calca.set_texture(load(global.calca))
	
	spr_personagem.set_centered(true)
	spr_personagem.set_position(Vector2(224,540))
	
	spr_cabelo.set_centered(true)
	spr_cabelo.set_position(Vector2(12.497, -447.267))
	spr_personagem.add_child(spr_cabelo)
	
	spr_blusa.set_centered(true)
	spr_blusa.set_position(Vector2(8.792, -158.287))
	spr_personagem.add_child(spr_blusa)
	
	spr_calca.set_centered(true)
	spr_calca.set_position(Vector2(0, 212.34))
	spr_personagem.add_child(spr_calca)
	
	return spr_personagem
	
func set_name(name):
	match (name):
		"personagem":
			return personagem.capitalize()
		_:
			return name.capitalize()


func set_escolhas(options, opt_dial):
	opt_dial[1].text = options[1]
	opt_dial[2].text = options[2]
	opt_dial[0].show()

func load_chars(characters : Dictionary, char_areas : Array):
	for i in range(len(char_areas)):
		char_areas[i].texture = null
		for child in char_areas[i].get_children():
			child.queue_free()
	if(len(characters) > 0):
		var names : Array = load_names(characters)
		var areas : Array = load_areas(names, char_areas)
		var flags : Array = load_flags(characters, names)
		
		for i in range(len(characters)):
			match (names[i]):
				"personagem":
					if(flags[i].find("#s") != -1):
						areas[i].add_child(load_sprite())
				"nina":
					if(flags[i].find("#s") != -1):
						areas[i].set_texture(load("res://Imagens/Objetos/Novel/Personagens/nina.png"))
				"gisele":
					if(flags[i].find("#s") != -1):
						areas[i].set_texture(load("res://Imagens/Objetos/Novel/Personagens/gisele.png"))
				_:
					pass

func load_text_dial(fala : Dictionary, txt_dial, opt_dial):
	var dialogo = fala["fala"]
	var type = fala["type"]
	match (type):
		"t":
			dialogo = dialogo.replace("[Pessoa]", personagem)
			dialogo = dialogo.replace("``", "\"")
			txt_dial.text = dialogo
		"a":
			var options = dialogo.split("/o/")
			txt_dial.text = options[0]
			set_escolhas(options, opt_dial)
		_:
			txt_dial.text = "Era para aparecer uma opção aqui..."

func load_text_personagem(characters : Dictionary, txt_persona):
	var name : String
	if(len(characters) > 0):
		var names : Array = load_names(characters)
		var flags : Array = load_flags(characters, names)
		for i in range(len(characters)):
			if(flags[i].find("#t") != -1):
				name = names[i]
				break;
			else:
				name = "???"
	else:
		name = "???"
	
	name = set_name(name)
	
	txt_persona.text = name