//Abstract factory

protocol Car {
    
    func drive()
    
}

class LittleSizeCar: Car {

    func drive() {
        print("Driving little size car")
    }
    
}

class MiddleSizeCar: Car {
    
    func drive() {
        print("Driving middle size car")
    }
    
}

protocol Bus {
    
    func drive()
    
}

class LittleSizeBus: Bus {
    
    func drive() {
        print("Driving little size bus")
    }
    
}

class MiddleSizeBus: Bus {
    
    func drive() {
        print("Driving middle size bus")
    }
    
}

protocol Factory {
    
    func produceBus() -> Bus
    func produceCar() -> Car
    
}

class LittleSizeFactory : Factory{
    
    func produceBus() -> Bus {
        print("Little size bus has been created")
        return LittleSizeBus()
    }
    
    func produceCar() -> Car {
        print("Little size car has been created")
        return LittleSizeCar()
    }
    
}

class MiddleSizeFactory : Factory{
    
    func produceBus() -> Bus {
        print("Middle size bus has been created")
        return MiddleSizeBus()
    }
    
    func produceCar() -> Car {
        print("Middle size car has been created")
        return MiddleSizeCar()
    }
    
}

let littleFactory = LittleSizeFactory()
let littleBus = littleFactory.produceBus()
littleBus.drive()
let littleCar = littleFactory.produceCar()
littleCar.drive()

let middleFactory = MiddleSizeFactory()
let middleBus = middleFactory.produceBus()
middleBus.drive()
let middleCar = middleFactory.produceCar()
middleCar.drive()
