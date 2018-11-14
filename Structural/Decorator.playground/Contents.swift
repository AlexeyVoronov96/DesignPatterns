//Decorator

protocol Porsche {
    
    func getPrice() -> Double
    func getDescription() -> String
    
}

class Boxster: Porsche {
    
    func getPrice() -> Double {
        return 150
    }
    
    func getDescription() -> String {
        return "Porsche Boxster"
    }
    
}

class Panamera: Porsche {
    
    func getPrice() -> Double {
        return 200
    }
    
    func getDescription() -> String {
        return "Porsche Panamera"
    }
    
}

class NineEleven: Porsche {
    
    func getPrice() -> Double {
        return 250
    }
    
    func getDescription() -> String {
        return "Porsche 911"
    }
    
}

class PorscheDecorator: Porsche {

    private let decoratedPorsche: Porsche
    
    required init(dp: Porsche) {
        self.decoratedPorsche = dp
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
    
}

class PremiumAudioSystem: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with premium audio system"
    }
    
}

class PanoramicSunroof: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 15
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }
    
}

var boxster: Porsche = Boxster()
boxster.getDescription()
boxster.getPrice()

boxster = PremiumAudioSystem(dp: boxster)
boxster.getDescription()
boxster.getPrice()

boxster = PanoramicSunroof(dp: boxster)
boxster.getDescription()
boxster.getPrice()
