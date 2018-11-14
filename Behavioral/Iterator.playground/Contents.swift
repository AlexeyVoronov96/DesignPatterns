//Iterator

class Driver {
    
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
    
}

class Car {
    
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    private var drivers = [Driver(isGood: true, name: "Alex"),
                           Driver(isGood: false, name: "Sergey"),
                           Driver(isGood: false, name: "Ivan"),
                           Driver(isGood: true, name: "Mariya")]
    
}

extension Car: Sequence {
    
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    
}

class GoodDriverIterator: IteratorProtocol {
    
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter{ $0.isGoodDriver }
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
    
}

class BadDriverIterator: IteratorProtocol {
    
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter{ !$0.isGoodDriver }
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
    
}

let car = Car()
let goodDriverIterator = car.goodDriverIterator.next()

let goodDriverIteratorViaSequence = car.makeIterator().allDrivers()
