import Foundation

enum Category {
    case electronics
    case clothing
    case food
    case books
}

struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    var displayPrice: String {
        return "$\(String(format: "%.2f", price))"
    }
    
    init(id: String = UUID().uuidString,
         name: String,
         price: Double,
         category: Category,
         description: String) {
        if price <= 0 {
            print("sum should be more then zero")
            self.price = 1.0
        } else {
            self.price = price
        }
        self.id = id
        self.name = name
        self.category = category
        self.description = description
    }
}

struct CartItem {
    var product: Product
    var quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        if newQuantity > 0 {
            quantity = newQuantity
        } else {
            print("⚠️ Количество должно быть больше нуля.")
        }
    }
    
    mutating func increaseQuantity(by amount: Int) {
        if amount > 0 {
            quantity += amount
        } else {
            print("⚠️ Нельзя увеличить на 0 или меньше.")
        }
    }
}


class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?
    
    
    func addItem(product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increaseQuantity(by: quantity)
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            items.append(newItem)
        }
    }
    
    func removeItem(productId: String) {
        items.removeAll { $0.product.id == productId }
    }
    
    func updateItemQuantity(productId: String, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            if quantity == 0 {
                removeItem(productId: productId)
            } else {
                items[index].updateQuantity(quantity)
            }
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var subtotal: Double {
        var total = 0.0
        for item in items {
            total += item.subtotal
        }
        return total
    }
    
    var discountAmount: Double {
        if discountCode == "SAVE10" {
            return subtotal * 0.10
        } else if discountCode == "SAVE20" {
            return subtotal * 0.20
        } else {
            return 0.0
        }
    }
    
    var total: Double {
        return subtotal - discountAmount
    }
    
    var itemCount: Int {
        var count = 0
        for item in items {
            count += item.quantity
        }
        return count
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}

struct Address {
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String {
        return "\(street)\n\(city), \(zipCode)\n\(country)"
    }
}

struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    var itemCount: Int {
        var count = 0
        for item in items {
            count += item.quantity
        }
        return count
    }
}


class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order] = []
    
    init(name: String, email: String) {
        self.userId = UUID().uuidString
        self.name = name
        self.email = email
    }
    
    func placeOrder(_ order: Order) {
        orderHistory.append(order)
    }
    
    var totalSpent: Double {
        var sum = 0.0
        for order in orderHistory {
            sum += order.total
        }
        return sum
    }
}



func testAll() {
    print("test")
    
    let laptop = Product(name: "MacBook Pro", price: 999.99, category: .electronics, description: "M3 Chip")
    let book = Product(name: "Clean Code", price: 30.0, category: .books, description: "Robert C. Martin")
    let headphones = Product(name: "AirPods", price: 199.99, category: .electronics, description: "Wireless")
    
    let cart = ShoppingCart()
    cart.addItem(product: laptop, quantity: 1)
    cart.addItem(product: book, quantity: 2)
    print("Cart subtotal:", cart.subtotal)
    
    cart.addItem(product: laptop, quantity: 1)
    print("Laptop quantity updated:", cart.items.first(where: { $0.product.id == laptop.id })?.quantity ?? 0)
    
    cart.discountCode = "SAVE10"
    print("Total with discount:", cart.total)
    
    func modifyCart(_ c: ShoppingCart) {
        c.addItem(product: headphones, quantity: 1)
    }
    modifyCart(cart)
    print("Cart item count after modify:", cart.itemCount)
    
    var item1 = CartItem(product: book, quantity: 1)
    var item2 = item1
    item2.updateQuantity(5)
    print("Item1 qty:", item1.quantity, "Item2 qty:", item2.quantity)
    
    let address = Address(street: "123 Main St", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
    let order = Order(from: cart, shippingAddress: address)
    
    cart.clearCart()
    print("Order items:", order.itemCount, "Cart items after clear:", cart.itemCount)
    
    let user = User(name: "Aizere", email: "aizere@example.com")
    user.placeOrder(order)
    print("User total spent:", user.totalSpent)
    
    print("end of test")
}

testAll()
