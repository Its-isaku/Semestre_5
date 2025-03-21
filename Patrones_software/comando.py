from abc import ABC, abstractmethod

#? Command Interface
class Command(ABC):
    @abstractmethod
    def execute(self):
        pass
    
    @abstractmethod
    def undo(self):
        pass

#? Receiver - The object that performs the actual operations
class TextEditor:
    def __init__(self):
        self.text = ""
    
    def write(self, text_to_add):
        #* Appends text to the current content
        self.text += text_to_add
        return f"Added: '{text_to_add}'"
    
    def delete(self, num_chars):
        #* Deletes the specified number of characters from the end
        if num_chars <= len(self.text):
            deleted_text = self.text[-num_chars:]
            self.text = self.text[:-num_chars]
            return f"Deleted: '{deleted_text}'"
        return "Error: Not enough characters to delete"
    
    def get_text(self):
        #* Returns the current text content
        return self.text

#? Concrete Commands
class WriteCommand(Command):
    def __init__(self, editor, text):
        #* Store the receiver and the text to add
        self.editor = editor
        self.text = text
    
    def execute(self):
        #* Execute the write operation and return the result
        return self.editor.write(self.text)
    
    def undo(self):
        #* Undo the write operation by deleting the added text
        self.editor.delete(len(self.text))
        return f"Undid writing: '{self.text}'"

class DeleteCommand(Command):
    def __init__(self, editor, num_chars):
        #* Store the receiver and the number of characters to delete
        self.editor = editor
        self.num_chars = num_chars
        self.deleted_text = ""
    
    def execute(self):
        #* Before deleting, store the text that will be deleted for undo
        if self.num_chars <= len(self.editor.text):
            self.deleted_text = self.editor.text[-self.num_chars:]
            result = self.editor.delete(self.num_chars)
            return result
        return "Error: Not enough characters to delete"
    
    def undo(self):
        #* Undo the delete operation by writing back the deleted text
        if self.deleted_text:
            self.editor.write(self.deleted_text)
            return f"Undid deletion: restored '{self.deleted_text}'"
        return "Nothing to undo"

#? Invoker - Controls the execution of commands and maintains history
class CommandInvoker:
    def __init__(self):
        #* Initialize an empty history of commands
        self.history = []
    
    def execute_command(self, command):
        #* Execute the command and add it to history
        result = command.execute()
        self.history.append(command)
        return result
    
    def undo_last_command(self):
        #* Undo the last command and remove it from history
        if self.history:
            command = self.history.pop()
            return command.undo()
        return "No commands to undo"

#? Client code
if __name__ == "__main__":
    #? Set up the receiver
    editor = TextEditor()
    
    #? Set up the invoker
    invoker = CommandInvoker()
    
    #? Execute some commands
    print("Initial text:", editor.get_text())
    
    #? Create and execute a write command
    write_cmd = WriteCommand(editor, "Hello, ")
    print(invoker.execute_command(write_cmd))
    print("Current text:", editor.get_text())
    
    #? Create and execute another write command
    write_cmd2 = WriteCommand(editor, "Command Pattern!")
    print(invoker.execute_command(write_cmd2))
    print("Current text:", editor.get_text())
    
    #? Create and execute a delete command
    delete_cmd = DeleteCommand(editor, 8)
    print(invoker.execute_command(delete_cmd))
    print("Current text:", editor.get_text())
    
    #? Undo the last command (delete)
    print("\nUndoing last command...")
    print(invoker.undo_last_command())
    print("Current text:", editor.get_text())
    
    #? Undo another command (second write)
    print("\nUndoing another command...")
    print(invoker.undo_last_command())
    print("Current text:", editor.get_text())
