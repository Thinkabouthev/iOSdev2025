import Foundation

class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?
    var discountType: DiscountType?  //bonus2
    
    init() {}
    
    func addItem(product: Product, quantity: Int = 1) {
        guard quantity > 0 else { return }
        
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
        guard let index = items.firstIndex(where: { $0.product.id == productId }) else { return }
        if quantity == 0 {
            removeItem(productId: productId)
        } else {
            items[index].updateQuantity(quantity)
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var subtotal: Double {
        return items.reduce(0) { $0 + $1.subtotal }
    }
    
//    var discountAmount: Double {
//        guard let code = discountCode else { return 0 }
//        switch code {
//        case "SAVE10": return subtotal * 0.10
//        case "SAVE20": return subtotal * 0.20
//        default: return 0
//        }
//    }
    var discountAmount: Double {
            if let discountType = discountType {
                switch discountType {
                case .percentage(let percent):
                    return subtotal * percent / 100
                case .fixedAmount(let amount):
                    return min(amount, subtotal)   // cannot exceed subtotal
                case .buyXGetY(let buy, let get):
                    // Example logic: for every (buy + get) group, get 'get' items free
                    var totalFree = 0
                    for item in items {
                        let freeItems = (item.quantity / (buy + get)) * get
                        totalFree += freeItems
                    }
                    let freeValue = items.first?.product.price ?? 0
                    return Double(totalFree) * freeValue
                }
            } else if let code = discountCode {
                // Original simple code-based discount
                switch code {
                case "SAVE10": return subtotal * 0.10
                case "SAVE20": return subtotal * 0.20
                default: return 0
                }
            }
            return 0
        } //bonus2
    
    
    var total: Double {
        return subtotal - discountAmount
    }
    
    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}

enum DiscountType {
    case percentage(Double)
    case fixedAmount(Double)
    case buyXGetY(buy: Int, get: Int)
}
//bonus2
