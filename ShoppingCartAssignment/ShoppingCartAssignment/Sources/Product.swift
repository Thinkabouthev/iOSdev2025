import Foundation

struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    var stockQuantity: Int //bonus3
    
    var displayPrice: String {
        return String(format: "$%.2f", price)
    }
        
    init?(id: String, name: String, price: Double, category: Category, description: String, stockQuantity: Int) {
        guard price > 0, stockQuantity >= 0 else {
            print(" Invalid product data for \(name)")
            return nil
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
    // bonus 3
        func addItem(product: Product, quantity: Int = 1) -> Bool {
            // Return false if insufficient stock
            guard product.stockQuantity >= quantity else {
                print("Not enough stock for \(product.name). Available: \(product.stockQuantity)")
                return false
            }
            
            // Otherwise add to cart
            if let index = items.firstIndex(where: { $0.product.id == product.id }) {
                items[index].increaseQuantity(by: quantity)
            } else {
                let newItem = CartItem(product: product, quantity: quantity)
                items.append(newItem)
            }
            return true
        }
}
