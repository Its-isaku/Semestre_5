#? Libraries  
import abc

#? Subject class
class Subject:
    def __init__(self):
        self._observers = set()
        
    def attach(self, observer):
        self._observers.add(observer)
        
    def detach(self, observer):
        self._observers.discard(observer)
        
    def notify(self, message):
        for observer in self._observers:
            observer.update(message)
            
#? Observer class
class Observer(metaclass=abc.ABCMeta):
    @abc.abstractmethod
    def update(self, message):
        pass
    
    
#? Concrete Observers
class Observer1(Observer):
    def update(self, message):
        print(f"Observer1: {message}")

class Observer2(Observer):
    def update(self, message):
        print(f"Observer2: {message}")

class Observer3(Observer):
    def update(self, message):
        print(f"Observer3: {message}")
        
#? Main
def main():
    #? Create subject and observers
    subject = Subject()
    observer1 = Observer1()
    observer2 = Observer2()
    observer3 = Observer3()
    
    #? Attach observers to subject
    subject.attach(observer1)
    subject.attach(observer2)
    subject.attach(observer3)
    
    #? Notify observers
    subject.notify("First Message!")
    
    #? Detach observer2
    subject.detach(observer2)
    
    #? Notify observers
    subject.notify("Second Message!")
    

if __name__ == "__main__":
    main()