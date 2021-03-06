//SingleTon

class Safe {
    
    static let shared = Safe()
    
    var money = 0
    
    private init() {}
    
}

class Money {
    
    func get(salary: Int) {
        Safe.shared.money += salary
        print("Your current salary is \(salary)$. There is \(Safe.shared.money)$ in your safe")
    }
    
    func take(money: Int) {
        if Safe.shared.money >= money {
            Safe.shared.money -= money
            print("You've taken \(money)$ from your safe. There is \(Safe.shared.money)$ in it")
        } else {
            print("Not enough money")
        }
    }
    
}

let money = Money()
money.get(salary: 5000)
money.get(salary: 10000)
money.take(money: 7000)
