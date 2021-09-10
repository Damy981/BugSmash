extends Button

var functionName
var instructions = []
var result
var atk = 2

func _on_Name_text_changed(new_text):
	functionName = new_text + "(ATT)"


func _on_Confirm_pressed():
	
	if PlayerProfile.coins < 50:
		get_parent().get_node("NotEnoughMoneyDialog").popup()
	else:
		PlayerProfile.coins -= 50
	
		for node in get_parent().get_node("CodeHistory/VBoxContainer").get_children():
			instructions.append(node.text)
	
		var operatorIndex = 10
		var numberIndex = 12
	
		for i in instructions.size():
			var operator = instructions[i][operatorIndex]
			var x = int(instructions[i].right(numberIndex))

			match operator:
				"+":
					atk = atk + x
					print(atk)
				"-":
					atk = atk - x
					print(atk)
				"*":
					atk = atk * x
					print(atk)
				"/":
					atk = atk / x
					print(atk)
				"=":
					atk = x
					print(atk)
				
		var function = {
			Name = functionName,
			Instructions = instructions,
			Result = atk
		}
				
		var save_file = File.new()
		if not save_file.file_exists("user://functions.save"):
			save_file.open("user://functions.save", File.WRITE)
			save_file.close()
		
		save_file.open("user://functions.save", File.READ_WRITE)
		save_file.seek_end()
		save_file.store_var(function)
		save_file.close()
	
		get_parent().get_node(".").hideFunctions()
		get_parent().get_node("ColorRectFunctions/ScrollContainer/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound").play()
