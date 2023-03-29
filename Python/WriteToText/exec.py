filename = "chat_history.txt"
mode = "a" # 追記モードでファイルを開く
with open(filename, mode) as file:
    file.write("User1: Hello, how are you?\n")
    file.write("ChatGPT: I'm fine, thank you. How about you?\n")
    file.write("User1: I'm good, thanks for asking.\n")