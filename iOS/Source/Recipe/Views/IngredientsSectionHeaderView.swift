import UIKit
import SweetUIKit

class IngredientsSectionHeaderView: UITableViewHeaderFooterView {
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.font = UIFont.bold(size: 18)
        label.textColor = .white
        label.text = NSLocalizedString("Instructions", comment: "")
        label.backgroundColor = .clear

        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        contentView.backgroundColor = UIColor.backgroundColor

        let margin = CGFloat(10)
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: margin).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -margin).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
