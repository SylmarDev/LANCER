extends Control


func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
