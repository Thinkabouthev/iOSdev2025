import UIKit


// Assign Class in Main.Storyboard to cell class type in Identity Inspector
class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var reviewLabel: UILabel!
    @IBOutlet private weak var imageContainer: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imageContainer.layer.cornerRadius = 10
        imageContainer.clipsToBounds = true

        titleLabel.numberOfLines = 1
        titleLabel.lineBreakMode = .byTruncatingTail

        subtitleLabel.numberOfLines = 1
        subtitleLabel.lineBreakMode = .byTruncatingTail

        reviewLabel.numberOfLines = 2
        reviewLabel.lineBreakMode = .byTruncatingTail
    }

    func configure(item: MovieItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        imageContainer.image = item.image
    }
}
