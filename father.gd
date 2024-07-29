extends Person

func handle_data(from: String, data: Dictionary):
	await get_tree().create_timer(1.5).timeout
	say_something("Emmm....")
