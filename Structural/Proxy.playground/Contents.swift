//Prroxy

class User {
    
    let name = "Alexey"
    let password = "123"
    
}

protocol ServerProtocol {
    
    func grantAccess(user: User)
    
}

class ServerSide: ServerProtocol {
    
    func grantAccess(user: User) {
        print("Access for user(name: \(user.name)) has been grannted")
    }
    
}

class ServerProxy: ServerProtocol {
    
    private var _server: ServerSide!
    
    func grantAccess(user: User) {
        guard _server != nil else {
            print("Access can't be granted")
            return
        }
        _server.grantAccess(user: user)
    }
    
    func authenticate(user: User) {
        guard user.password == "123" else { return }
        print("User \(user.name) has been authenticated")
        _server = ServerSide()
    }
    
}

let user = User()
let proxy = ServerProxy()

proxy.grantAccess(user: user)
proxy.authenticate(user: user)
proxy.grantAccess(user: user)
