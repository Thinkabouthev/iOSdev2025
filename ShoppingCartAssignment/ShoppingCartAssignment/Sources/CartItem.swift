import Foundation

struct CartItem {
    var product: Product
    var quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
        
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else {
            print("Quantity should be greater than zero.")
            return
        }
        quantity = newQuantity
    }
        
    mutating func increaseQuantity(by amount: Int) {
        guard amount > 0 else { return }
        quantity += amount
    }
}
