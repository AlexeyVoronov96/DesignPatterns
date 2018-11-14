//Chain of responsibility

class Enemy {
    
    let strength = 600
    
}

protocol MilitaryChain {
    
    var strength: Int { get }
    var nextRank: MilitaryChain? { get set }
    
    func shouldDefeatWithStrength(amount: Int)
    
}

class Soldier: MilitaryChain {
    
    var strength = 100
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Enemy was defeated by soldier")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
    
}

class Officer: MilitaryChain {
    
    var strength = 500
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Enemy was defeated by officer")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
    
}

class General: MilitaryChain {
    
    var strength = 1000
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Enemy was defeated by general")
        } else {
            print("Enemy is too strong")
        }
    }
    
}

let enemy = Enemy()
let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general

soldier.shouldDefeatWithStrength(amount: enemy.strength)
