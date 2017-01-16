import UIKit
import SweetUIKit

class RecipeCell: UITableViewCell {
    lazy var thumbnailImageView: UIImageView = {
        let view = UIImageView(withAutoLayout: true)
        view.contentMode = .scaleAspectFill
        view.backgroundColor = UIColor.darkGray

        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.textColor = UIColor.white
        label.font = UIFont.medium(size: 20)

        return label
    }()

    lazy var fadeView: UIImageView = {
        let view = UIImageView(withAutoLayout: true)
        view.image = UIImage(named: "bottom-fade")!

        return view
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = UIColor.darkGray

        addSubview(thumbnailImageView)
        addSubview(fadeView)
        addSubview(titleLabel)

        clipsToBounds = true

        thumbnailImageView.fillSuperview()

        let margin = CGFloat(10)
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin).isActive = true

        fadeView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        fadeView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        fadeView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var recipe: Recipe? {
        didSet {
            titleLabel.text = recipe?.title
            thumbnailImageView.image = nil
            thumbnailImageView.alpha = 0
        }
    }
}
