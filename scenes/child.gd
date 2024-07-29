extends Person

func handle_data (from: String, data: Dictionary):
	# 等待0.5s
	await get_tree().create_timer(1.5).timeout
	send_data(from, {"content": "Hi! " + from})
	
