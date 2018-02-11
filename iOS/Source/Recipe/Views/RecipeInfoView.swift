import UIKit
import SweetUIKit

protocol RecipeInfoViewDelegate: class {
    func recipeInfoView(_ recipeInfoView: RecipeInfoView, didPressViewInstructionsButton button: UIButton)
    func recipeInfoView(_ recipeInfoView: RecipeInfoView, didPressViewOriginalButton button: UIButton)
}

class RecipeInfoView: UIView {
    weak var delegate: RecipeInfoViewDelegate?

    static func button() -> UIButton {
        let button = UIButton(withAutoLayout: true)
        button.setTitleColor(UIColor.brandColor, for: .normal)
        button.titleLabel?.font = UIFont.bold(size: 17)

        return button
    }

    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.font = UIFont.bold(size: 18)
        label.textColor = .white
        label.text = NSLocalizedString("Information", comment: "")
        label.backgroundColor = .clear

        return label
    }()

    fileprivate lazy var viewInstructionsButton: UIButton = {
        let button = RecipeInfoView.button()
        button.setTitle(NSLocalizedString("View Instructions", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(viewInstructions(button:)), for: .touchUpInside)

        return button
    }()

    fileprivate lazy var viewOriginalButton: UIButton = {
        let button = RecipeInfoView.button()
        button.setTitle(NSLocalizedString("View Original", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(viewOriginal(button:)), for: .touchUpInside)

        return button
    }()

    static func label() -> UILabel {
        let label = UILabel(withAutoLayout: true)
        label.font = UIFont.medium(size: 16)
        label.textColor = .white

        return label
    }

    fileprivate lazy var publisherNameLabel: UILabel = {
        let label = RecipeInfoView.label()
        label.textAlignment = .left

        return label
    }()

    fileprivate lazy var socialRankLabel: UILabel = {
        let label = RecipeInfoView.label()
        label.textAlignment = .right

        return label
    }()

    var recipe: Recipe? {
        didSet {
            if let recipe = recipe {
                publisherNameLabel.text = recipe.publisher
                socialRankLabel.text = String.localizedStringWithFormat(NSLocalizedString("Social rank: %@", comment: ""), recipe.rank)
            } else {
                publisherNameLabel.text = nil
                socialRankLabel.text = nil
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.backgroundColor
        addSubview(titleLabel)
        addSubview(viewInstructionsButton)
        addSubview(viewOriginalButton)
        addSubview(publisherNameLabel)
        addSubview(socialRankLabel)

        let margin = CGFloat(10)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: margin).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin).isActive = true

        let buttonHeight = CGFloat(55)
        let titleLabelHeight = CGFloat(35)
        viewInstructionsButton.topAnchor.constraint(equalTo: topAnchor, constant: titleLabelHeight).isActive = true
        viewInstructionsButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewInstructionsButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true

        viewOriginalButton.topAnchor.constraint(equalTo: topAnchor, constant: titleLabelHeight + buttonHeight).isActive = true
        viewOriginalButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewOriginalButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true

        let labelMargin = CGFloat(10)
        publisherNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -labelMargin).isActive = true
        publisherNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: labelMargin).isActive = true
        publisherNameLabel.rightAnchor.constraint(equalTo: socialRankLabel.leftAnchor).isActive = true

        socialRankLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -labelMargin).isActive = true
        socialRankLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -labelMargin).isActive = true
        socialRankLabel.leftAnchor.constraint(equalTo: publisherNameLabel.rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func viewInstructions(button: UIButton) {
        delegate?.recipeInfoView(self, didPressViewInstructionsButton: button)
    }

    @objc func viewOriginal(button: UIButton) {
        delegate?.recipeInfoView(self, didPressViewOriginalButton: button)
    }
}
