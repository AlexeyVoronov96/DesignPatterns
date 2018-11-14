//Template method

class DriveVehicle {
    
    final func startVehicle() {
        haveASeat()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("this method should be overriden")
    }
    
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    
    func lookAtTheMirror() {
        preconditionFailure("this method should be overriden")
    }
    
    func turnSignal() {
        preconditionFailure("this method should be overriden")
    }
    
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
    
}

class Bicycle: DriveVehicle {
    
    override func haveASeat() {
        print("Sitting down on a bicycle seat")
    }
    
    override func useProtection() {
        print("Putting the helmet on")
    }
    
    override func lookAtTheMirror() {
        print("Looking at the mirror")
    }
    
    override func turnSignal() {
        print("Showing left hand")
    }
    
    override func driveForward() {
        print("Moving forward")
    }
    
}

class Car: DriveVehicle {
    
    override func haveASeat() {
        print("Sitting down on a car seat")
    }
    
    override func useProtection() {
        print("Fastening the seat belt")
    }
    
    override func lookAtTheMirror() {
        print("Looking at the rearview mirror")
    }
    
    override func turnSignal() {
        print("Turning on left turn light")
    }
    
    override func driveForward() {
        print("Pushing gas pedal")
    }
    
}

let car = Car()
car.startVehicle()

print("\n")

let bicycle = Bicycle()
bicycle.startVehicle()
