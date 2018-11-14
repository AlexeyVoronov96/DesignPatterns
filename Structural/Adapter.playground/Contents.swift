//Adapter

//MARK: - Adaptee
class SimpleCar {
    
    func sound() -> String {
        return "sound"
    }
    
}

//MARK: - Target
protocol SuperCarProtocol {
    
    func makeNoize() -> String
    
}

class SuperCar: SuperCarProtocol {
    
    func makeNoize() -> String {
        return "super car sound"
    }
    
}

//MARK: - Adapter
class superCarAdapter: SuperCarProtocol {
    
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    
    func makeNoize() -> String {
        return simpleCar.sound()
    }
}
