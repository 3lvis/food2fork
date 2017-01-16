import UIKit

class IngredientCell: UITableViewCell {
    private lazy var ingredientLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.font = UIFont.regular(size: 16)
        label.textColor = UIColor.white
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 0

        return label
    }()

    var indexPath: IndexPath? {
        didSet {
            let row = indexPath?.row ?? 0
            let isAlternative = row % 2 == 0
            if isAlternative {
                contentView.backgroundColor = UIColor.backgroundColor
            } else {
                contentView.backgroundColor = UIColor.darkerBackgroundColor
            }
        }
    }

    var ingredient: String? {
        didSet {
            ingredientLabel.text = ingredient
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        contentView.addSubview(ingredientLabel)

        let margin = CGFloat(10)
        ingredientLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin).isActive = true
        ingredientLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
        ingredientLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: margin).isActive = true
        ingredientLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -margin).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
