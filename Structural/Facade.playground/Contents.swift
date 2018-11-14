//Facade

class FruitShop {
    
    func buyFruits() -> String {
        return "fruits"
    }
    
}

class MeatShop {
    
    func buyMeat() -> String {
        return "meat"
    }
    
}

class MilkShop {
    
    func buyMilk() -> String {
        return "milk"
    }
    
}

class SweetShop {
    
    func buySweets() -> String {
        return "sweets"
    }
    
}

class BreadShop {
    
    func buyBread() -> String {
        return "bread"
    }
    
}

//MARK: - Facade
class Supermarket {
    
    private let _fruitShop = FruitShop()
    private let _meatshop = MeatShop()
    private let _miilkShop = MilkShop()
    private let _sweetShop = SweetShop()
    private let _breadShop = BreadShop()
    
    func buyProducts() -> String {
        var products = ""
        products += _fruitShop.buyFruits() + ", "
        products += _meatshop.buyMeat() + ", "
        products += _miilkShop.buyMilk() + ", "
        products += _sweetShop.buySweets() + ", "
        products += _breadShop.buyBread()
        return "I bought: " + products
    }
    
}

let sm = Supermarket()
sm.buyProducts()

