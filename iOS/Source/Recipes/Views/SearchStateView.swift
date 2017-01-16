import UIKit

class SearchStateView: UIView {
    enum State {
        case searchPending
        case displayingResults
        case searching
        case noResultsFound
    }

    var state: State? {
        didSet {
            let state = self.state ?? .searchPending

            loadingIndicator.stopAnimating()

            switch state {
            case .searchPending:
                titleLabel.text = NSLocalizedString("Let's Cook Something", comment: "")
                subtitleLabel.text = NSLocalizedString("What about searching for something sweet?", comment: "")
            case .displayingResults:
                titleLabel.text = nil
                subtitleLabel.text = nil
            case .searching:
                titleLabel.text = NSLocalizedString("Searching...", comment: "")
                subtitleLabel.text = nil
                loadingIndicator.startAnimating()
            case .noResultsFound:
                titleLabel.text = NSLocalizedString("No Matching Recipes", comment: "")
                subtitleLabel.text = NSLocalizedString("Try a different search term.", comment: "")
            }
        }
    }

    lazy var titleLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.textAlignment = .center
        label.font = UIFont.bold(size: 17)
        label.textColor = UIColor.brandColor

        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.textAlignment = .center
        label.font = UIFont.regular(size: 14)
        label.textColor = UIColor.lightGray

        return label
    }()

    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(withAutoLayout: true)
        loadingIndicator.activityIndicatorViewStyle = .white
        loadingIndicator.hidesWhenStopped = true

        return loadingIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        isUserInteractionEnabled = false
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(loadingIndicator)

        let height = CGFloat(20)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -height).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: height).isActive = true

        subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: height).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: height).isActive = true

        loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor, constant: height).isActive = true
        loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
