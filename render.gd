extends Node

var busy := false
var output := "/tmp/godot.cfdg.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func render(file):
	OS.execute("cfdg", [file, output], [], false, false)
