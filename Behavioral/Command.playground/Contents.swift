//Command

class Account {
    
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
    
}

protocol Command {
    
    var isComplete: Bool { get set }
    
    func execute()
    
}

class Deposite: Command {
    
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
    
}

class Withdraw: Command {
    
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("Not enough money")
        }
    }
    
}

class TransactionManager {
    
    static let shared = TransactionManager()
    private init() {}
    private var _transactions: [Command] = []
    
    var pendingTransactions: [Command] {
        get {
            return self._transactions.filter{ $0.isComplete == false }
        }
    }
    
    func addTransactions(command: Command) {
        self._transactions.append(command)
    }
    
    func processingTransactions() {
        _transactions.filter{ $0.isComplete == false }.forEach{ $0.execute() }
    }
}

let account = Account(accountName: "Alexey", balance: 10000)
let transactionManager = TransactionManager.shared
transactionManager.addTransactions(command: Deposite(account: account, amount: 4000))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 1000))
transactionManager.pendingTransactions
account.balance
transactionManager.processingTransactions()
account.balance
