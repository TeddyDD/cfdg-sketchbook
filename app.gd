extends Control

# TODO: random file name
const FILE := "/tmp/godot.cfdg"

var render := preload("res://render.gd").new()

func _ready():
	var keywords = [
		"startshape",
		"shape",
		"rule",
	]
	
	var hl := CodeHighlighter.new()
	hl.symbol_color = Color.VIOLET
	hl.number_color = Color(0.7259184718132, 0.9949923157692, 0.74536508321762)
	
	for k in keywords:
		hl.add_keyword_color(k,Color.AQUA)
	for k in ["CIRCLE", "SQUARE", "TRIANGLE"]:
		hl.add_keyword_color(k, Color.CORNFLOWER_BLUE)
		
	%code.syntax_highlighter = hl
	save_file()

func save_file():
	var f := FileAccess.open(FILE, FileAccess.WRITE)
	f.store_string(%code.text + "\n")

func _on_code_text_changed():
	save_file()


func _on_render_pressed():
	render.render(FILE)
	var img := Image.new()
	img.load(render.output)
	var texture := ImageTexture.create_from_image(img)

	var out := %output as TextureRect
	out.texture = texture

	pass # Replace with function body.
