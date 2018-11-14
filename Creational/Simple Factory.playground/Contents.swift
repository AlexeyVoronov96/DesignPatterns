//Simple factory

enum CarType {
    
    case huge, fast
    
}

protocol Car {
    
    func drive()
    
}

class HugeCar: Car {
    
    func drive() {
        print("You drive huge car")
    }
    
}

class FastCar: Car {
    
    func drive() {
        print("You drive fast car")
    }
    
}

class CarFactory {
    
    static func porduceCar(type: CarType) -> Car {
        var car: Car
        
        switch type {
        case .fast: car = FastCar()
        case .huge: car = HugeCar()
        }
        return car
    }
    
}

let hugeCar = CarFactory.porduceCar(type: .huge)
hugeCar.drive()

let fastCar = CarFactory.porduceCar(type: .fast)
fastCar.drive()
