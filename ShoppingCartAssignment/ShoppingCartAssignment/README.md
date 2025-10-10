Overview

This project demonstrates the difference between value types (structs) and reference types (classes) in Swift through a simple shopping cart system. The system includes products, cart items, a shopping cart, orders, addresses, and a user class.
Each type was intentionally chosen to highlight how Swift manages data ownership, copying, and shared references in real-world app logic.

The project was implemented entirely in Swift and tested through console outputs to show expected behaviors step by step.


Why I Chose class for ShoppingCart

I used a class for the ShoppingCart because a cart represents a shared, mutable object in the app — it has an identity.
For example, if the same cart is referenced in two different screens (like product view and checkout view), both should always show the same data.

Classes in Swift are reference types, meaning that when you assign or pass a cart to another variable or function, they all point to the same memory reference.
That’s exactly what I needed for this system — a single shared cart instance that reflects changes everywhere without copying its contents.

This also allowed me to demonstrate reference semantics clearly: modifying a cart inside a function (modifyCart()) automatically updates the original one.


Why I Chose struct for Product and Order

I used structs for both Product and Order because these represent independent value data that does not need shared identity.
    •    Product is just a data model: name, price, description, etc. Copying a product does not need to affect any other copy.
    •    Order represents a snapshot of the cart at checkout time. Once created, it should remain immutable — its data should never change even if the cart is cleared later.

Structs in Swift are value types, so every copy is completely independent. This guarantees immutability and safe data separation between cart and order.


Example of Reference Semantics

In my test scenario, I passed the same ShoppingCart instance into a function called modifyCart(_:), which added another product.
Because ShoppingCart is a class, both the original and the function parameter referred to the same object in memory.
After calling the function, the main cart instance was also updated — proving that reference semantics allow shared, mutable state.


Example of Value Semantics

I also created two copies of a CartItem struct (item1 and item2) and changed the quantity of item2.
The change did not affect item1, showing that each struct instance holds its own independent value.
This behavior illustrates how Swift automatically copies structs when assigning them to new variables, ensuring predictable and isolated changes.


Challenges Faced and Solutions

The biggest challenge was understanding when to use mutating methods and how value semantics behave in practice.
At first, I forgot that structs need mutating before modifying their properties — the compiler reminded me, and readinп Swift documentation helped clarify why.

Another challenge was managing computed properties such as subtotal, total, and discountAmount without introducing logic errors.
I solved it by printing intermediate results during testing and validating every change step-by-step.

Finally, testing reference vs. value behavior was confusing at first, but creating clear print outputs with emojis and descriptive messages made it easier to observe differences in runtime.
