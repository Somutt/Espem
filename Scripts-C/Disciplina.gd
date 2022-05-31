extends TextureButton

class_name Disciplina

var nome : String
var codigo : String
var ementa : String
var prereq
var creditos : String
var carga : String

func parse_prereq(prerequisitos : Array) -> String:
	var string : = ""
	if(len(prerequisitos) > 0):
		for i in range(len(prerequisitos)):
			if(i != 0):
				string += ", "
			string += str(prerequisitos[i])
	return string

func load_values(disciplina, codigo):
	self.nome = disciplina["nome"]
	self.codigo = codigo
	self.ementa = disciplina["ementa"]
	self.prereq = parse_prereq(disciplina["pre"])
	self.creditos = disciplina["creditos"]
	self.carga = disciplina["carga"]

func load_popup(popup, card):
	card.get_node("Titulo").text = self.nome
	card.get_node("Codigo").text = self.codigo
	card.get_node("Ementa").text = self.ementa
	card.get_node("Preres").text = self.prereq
	card.get_node("Creditos").text = self.creditos
	card.get_node("Carga").text = self.carga
	popup.show()