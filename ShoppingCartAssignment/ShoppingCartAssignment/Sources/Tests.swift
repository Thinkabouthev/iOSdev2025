import Foundation

func runTests() {
    print("Test starts\n")
    
    // 1 Create sample products
    let laptop = Product(id: "P001", name: "Laptop", price: 1200.00, category: .electronics, description: "MacBook Pro M3")!
    let book = Product(id: "P002", name: "Book", price: 25.99, category: .books, description: "Swift for Beginners")!
    let headphones = Product(id: "P003", name: "Marshall", price: 79.99, category: .electronics, description: "Wireless Headphones")!
    
    // 2 Test adding items to cart
    let cart = ShoppingCart()
    cart.addItem(product: laptop, quantity: 1)       // Add 1 laptop
    cart.addItem(product: book, quantity: 2)         // Add 2 books
    print("Cart items count: \(cart.itemCount)")
    print("Subtotal after first additions: \(cart.subtotal)\n")
    
    // 3 Test adding same product twice (should update quantity)
    cart.addItem(product: laptop, quantity: 1)       // Add laptop again → total laptops = 2
    print("After adding same product again, laptop quantity should be 2.")
    print("Cart items count: \(cart.itemCount)")
    print("Subtotal: \(cart.subtotal)\n")
    
    // 4 Test cart calculations
    print("Subtotal (no discount): \(cart.subtotal)")
    print("Item count: \(cart.itemCount)\n")
    
    // 5 Test discount code
    cart.discountCode = "SAVE10"                    // Apply 10% discount
    print("Total with discount code 'SAVE10': \(cart.total)\n")
    
    // 6 Test removing items
    cart.removeItem(productId: book.id)
    print("After removing book, item count: \(cart.itemCount)\n")
    
    // 7 Demonstrate REFERENCE TYPE behavior
    func modifyCart(_ cart: ShoppingCart) {
        cart.addItem(product: headphones)
    }
    modifyCart(cart)
    print("After modifyCart(), item count: \(cart.itemCount) → proves reference semantics\n")
    
    // 8 Demonstrate VALUE TYPE behavior
    var item1 = CartItem(product: laptop, quantity: 1)
    var item2 = item1
    item2.updateQuantity(5)
    print("item1.quantity = \(item1.quantity), item2.quantity = \(item2.quantity)\n")
    
    // 9 Create order from cart
    let address = Address(street: "Tole Bi 59", city: "Almaty", zipCode: "000005", country: "Kazakhstan")
    let order = Order(from: cart, shippingAddress: address)
    print("Order \(order.orderId) created with \(order.itemCount) items.\n")
    
    // 10 Modify cart after order creation
    cart.clearCart()
    print("After clearing cart:")
    print("Cart item count: \(cart.itemCount)")      // Should be 0
    print("Order item count: \(order.itemCount) (order unchanged)\n")
    
    
    // bonus: Create user and place order
    // Demonstrates User class and order history
    let user = User(name: "Dariya", email: "dariya@kbtu.com")
    user.placeOrder(order)
    print("User total spent: \(user.totalSpent)\n")
    
    
    print("All tests completed\n")
}

runTests()
