import Foundattion

class User {
    let userId: Int
    let name: String
    let email: String
    private(set) var orderHistory: [Order]
    
    init(name: String, email: String) {
            self.userId = UUID().uuidString
            self.name = name
            self.email = email
        }
    
    func placeOrder(_ order: Order){
        orderHistory.append(order)
    }
    
    var totalSpent: Double {
            orderHistory.reduce(0) { $0 + $1.total }
        }
}
//bonus1
