import UIKit

struct CatMeme {
    let title: String
    let description: String
    let imageName: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let memes: [CatMeme] = [
            CatMeme(
                title: "Crying Cat",
                description: "Я, когда преподаватель говорит, что работа в группах.",
                imageName: "cat1"
            ),
            CatMeme(
                title: "Math Cat",
                description: "Я, когда пытаюсь понять как настраивать constraits.",
                imageName: "cat2"
            ),
            CatMeme(
                title: "Explosion Cat",
                description: "Я после дедлайна, когда всё-таки сдал работу.",
                imageName: "cat3"
            ),
            CatMeme(
                title: "AAAAA Cat",
                description: "Я, когда Xcode выдаёт новую ошибку перед сдачей.",
                imageName: "cat4"
            ),
            CatMeme(
                title: "Fire Head Cat",
                description: "Я, когда нужно сдать пять лабораторных за один вечер.",
                imageName: "cat5"
            ),
            CatMeme(
                title: "Shocked Cat",
                description: "Я, когда узнал, что экзамен будет устным.",
                imageName: "cat6"
            ),
            CatMeme(
                title: "Smart Cat",
                description: "Я, когда наконец поняла, как работает Auto Layout.",
                imageName: "cat7"
            ),
            CatMeme(
                title: "Loading Cat",
                description: "Я, когда сижу на паре и пытаюсь понять, что происходит.",
                imageName: "cat8"
            ),
            CatMeme(
                title: "Wet Cat",
                description: "Я, когда поняла что гит сместил все дедлайны.",
                imageName: "cat9"
            ),
            CatMeme(
                title: "Confused Cat",
                description: "Я, когда случайно удалила весь проект перед защитой.",
                imageName: "cat10"
            )
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showRandomMeme()
    }
    
    @IBAction func randomizeTapped(_ sender: UIButton) {
        showRandomMeme()
    }
    
    private func showRandomMeme() {
        guard let meme = memes.randomElement() else { return }
        
        UIView.transition(with: catImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.catImageView.image = UIImage(named: meme.imageName)
        }, completion: nil)
        
        titleLabel.text = meme.title
        descriptionLabel.text = meme.description
    }
    
    private func setupUI() {
        catImageView.contentMode = .scaleAspectFit
        catImageView.layer.cornerRadius = 16
        catImageView.clipsToBounds = true
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
    }
}
