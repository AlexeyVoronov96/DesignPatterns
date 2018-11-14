//Prroxy

class User {
    let id = "123"
}

protocol ServerProtocol {
    
    func grantAccess(user: User)
    
    func denyAccess(user: User)
    
}

class ServerSide: ServerProtocol {
    
    func grantAccess(user: User) {
        print("Access for user(id: \(user.id)) has been grannted")
    }
    
    func denyAccess(user: User) {
        print("Access for user(id: \(user.id)) has been denied")
    }
    
}

class ServerProxy: ServerProtocol {
    
    lazy private var server: ServerSide = ServerSide()
    
    func grantAccess(user: User) {
        server.grantAccess(user: user)
    }
    
    func denyAccess(user: User) {
        server.denyAccess(user: user)
    }
    
}

let user = User()
let proxy = ServerProxy()
proxy.grantAccess(user: user)
proxy.denyAccess(user: user)
