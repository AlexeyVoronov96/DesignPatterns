//Factory method

protocol Vehicle {
    
    func drive()
    
}

class Car: Vehicle {
    
    func drive() {
        print("Driving car")
    }
    
}

class Truck: Vehicle {
    
    func drive() {
        print("Driving truck")
    }
    
}

class Bus: Vehicle {
    
    func drive() {
        print("Driving bus")
    }
    
}

protocol VehicleFactory {
    
    func produce() -> Vehicle
    
}

class CarFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        print("Car has been created")
        return Car()
    }
    
}

class TruckFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        print("Truck has been created")
        return Truck()
    }
    
}

class BusFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        print("Bus has been created")
        return Bus()
    }
    
}

let carFactory = CarFactory()
let car = carFactory.produce()
car.drive()

let truckFactory = TruckFactory()
let truck = truckFactory.produce()
truck.drive()

let busFactory = BusFactory()
let bus = busFactory.produce()
bus.drive()
