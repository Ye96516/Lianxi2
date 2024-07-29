class_name Person
extends Node2D

@export var node_name = "unnamed_person"
@onready var name_label: Label = $NameLabel
@onready var say_label: Label = $SayLabel
@onready var say_pop_timer: Timer = $SayPopTimer

func _ready() -> void:
	init()

func init ():
	EventBus.trans_data.connect(recive_data)
	name_label.text = node_name

func recive_data(from: String, to: String, data: Dictionary):
	if to != node_name and to != "":
		return
	handle_data(from, data)

func send_data(target: String, data: Dictionary):
	if data["content"] == null:
		push_error("trans data error: no content")
		return
	EventBus.trans_data.emit(node_name, target, data)
	say_something("to " + target + ": " + data["content"])
	
func handle_data(from: String, data: Dictionary):
	pass

func say_something(sth: String):
	say_pop_timer.start()
	say_label.text = sth
	say_label.visible = true

func _on_say_pop_timer_timeout() -> void:
	say_label.visible = false
