extends Person

func _ready() -> void:
	super()
	await get_tree().create_timer(.5).timeout
	say_something("Nice day ! ! ! ! !")
	
	await get_tree().create_timer(3.0).timeout
	send_data("child", {"content": "Hi! deer grand son."})
	
	await get_tree().create_timer(4.0).timeout
	send_data("father", {"content": "Hi! deer son."})
