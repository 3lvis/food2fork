import UIKit
import SweetUIKit

protocol RecipeInfoViewDelegate: class {
    func recipeInfoView(_ recipeInfoView: RecipeInfoView, didPressViewInstructionsButton button: UIButton)
    func recipeInfoView(_ recipeInfoView: RecipeInfoView, didPressViewOriginalButton button: UIButton)
}

class RecipeInfoView: UIView {
    weak var delegate: RecipeInfoViewDelegate?

    fileprivate lazy var viewInstructionsButton: UIButton = {
        let button = UIButton(withAutoLayout: true)
        button.setTitle("View Instructions", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(viewInstructions(button:)), for: .touchUpInside)

        return button
    }()

    fileprivate lazy var viewOriginalButton: UIButton = {
        let button = UIButton(withAutoLayout: true)
        button.setTitle("View Original", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(viewOriginal(button:)), for: .touchUpInside)

        return button
    }()

    fileprivate lazy var publisherNameLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.text = "Mchine Learning Puh"
        label.textAlignment = .left

        return label
    }()

    fileprivate lazy var socialRankLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.text = "Social ranking: 100"
        label.textAlignment = .right

        return label
    }()

    var recipe: Recipe? {
        didSet {
            if let recipe = recipe {
                publisherNameLabel.text = recipe.publisher
                socialRankLabel.text = "Social rank: \(recipe.rank)"
            } else {
                publisherNameLabel.text = nil
                socialRankLabel.text = nil
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(viewInstructionsButton)
        addSubview(viewOriginalButton)
        addSubview(publisherNameLabel)
        addSubview(socialRankLabel)

        let buttonHeight = CGFloat(55)
        viewInstructionsButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewInstructionsButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewInstructionsButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true

        viewOriginalButton.topAnchor.constraint(equalTo: topAnchor, constant: buttonHeight).isActive = true
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

    func viewInstructions(button: UIButton) {
        delegate?.recipeInfoView(self, didPressViewInstructionsButton: button)
    }

    func viewOriginal(button: UIButton) {
        delegate?.recipeInfoView(self, didPressViewOriginalButton: button)
    }
}
