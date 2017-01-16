import UIKit

class LoadingCell: UITableViewCell {
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(withAutoLayout: true)
        view.activityIndicatorViewStyle = .white

        return view
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = UIColor.backgroundColor
        contentView.addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        loadingIndicator.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
