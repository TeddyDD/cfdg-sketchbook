extends Control

# TODO: random file name
var FILE := "/tmp/godot.cfdg"

var render := preload("res://render.gd").new()

func _ready():
	var keywords = [
		"startshape",
		"shape",
		"rule",
	]

	for k in keywords:
		$Panel/HSplitContainer/VBoxContainer/code.add_keyword_color(k, Color.aqua)
	for k in ["CIRCLE", "SQUARE", "TRIANGLE"]:
		$Panel/HSplitContainer/VBoxContainer/code.add_keyword_color(k, Color.cornflower)
	save_file()

func save_file():
	var f := File.new()
	f.open(FILE, File.WRITE)
	f.store_string($Panel/HSplitContainer/VBoxContainer/code.text + "\n")

func _on_code_text_changed():
	save_file()


func _on_render_pressed():
	render.render(FILE)
	var img := Image.new()
	img.load(render.output)
	var texture := ImageTexture.new()
	texture.create_from_image(img, 0)

	var out := $Panel/HSplitContainer/output as TextureRect
	out.texture = texture

	pass # Replace with function body.
