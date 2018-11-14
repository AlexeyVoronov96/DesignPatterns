//State

protocol State {
    
    func on(printer: Printer)
    
    func off(printer: Printer)
    
    func printDocument(printer: Printer)
    
}

class On: State {
    
    func on(printer: Printer) {
        print("Printer is already turned on")
    }
    
    func off(printer: Printer) {
        print("Turning printer off")
        printer.set(state: Off())
    }
    
    func printDocument(printer: Printer) {
        print("Printing...")
        printer.set(state: Print())
    }
    
}

class Off: State {
    
    func on(printer: Printer) {
        print("Turning printer on")
        printer.set(state: On())
    }
    
    func off(printer: Printer) {
        print("Printer is already turned off")
    }
    
    func printDocument(printer: Printer) {
        print("Printer is turned off")
    }
    
}

class Print: State {
    
    func on(printer: Printer) {
        print("Printer is already turned on")
    }
    
    func off(printer: Printer) {
        print("Turning printer off")
        printer.set(state: Off())
    }
    
    func printDocument(printer: Printer) {
        print("Printer is already printing")
    }
    
}

class Printer {
    
    var state: State
    
    init() {
        self.state = Off()
    }
    
    func set(state: State) {
        self.state = state
    }
    
    func turnOn() {
        state.on(printer: self)
    }
    
    func turnOff() {
        state.off(printer: self)
    }
    
    func printDocument() {
        state.printDocument(printer: self)
    }
    
}

let printer = Printer()
printer.turnOn()
printer.printDocument()
printer.turnOff()
printer.printDocument()
printer.turnOn()
printer.printDocument()
