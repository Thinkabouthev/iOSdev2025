import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lhsDice: UIImageView!
    @IBOutlet weak var rhsDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let diceImages = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        lhsDice.image = UIImage(named: "DiceThree")
        rhsDice.image = UIImage(named: "DiceFour")
        rollButton.layer.cornerRadius = 16
        rollButton.backgroundColor = .systemTeal
        rollButton.setTitle("Roll", for: .normal)
        rollButton.setTitleColor(.white, for: .normal)
    }

    @IBAction func rollButtonDidTap(_ sender: UIButton) {
        rollDice()
    }
    
    func rollDice() {
        lhsDice.image = diceImages.randomElement() ?? UIImage(named: "DiceOne")
        rhsDice.image = diceImages.randomElement() ?? UIImage(named: "DiceOne")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDice()
        }
    }
}
