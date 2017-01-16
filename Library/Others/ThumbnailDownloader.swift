import Foundation
import UIKit
import Networking

protocol ThumbnailDownloaderDelegate: class {
    func thumbnailDownloader(_ thumbnailDownloader: ThumbnailDownloader, didFinishDownloadingImage image: UIImage? , error: NSError?)
}

class ThumbnailDownloader {
    static let iconSize = CGFloat(48)

    weak var delegate: ThumbnailDownloaderDelegate?

    var imageURL: String
    var indexPath: IndexPath
    var requestIdentifier: String?

    init?(recipe: Recipe, indexPath: IndexPath) {
        if let imageURL = recipe.imageURL {
            self.imageURL = imageURL
            self.indexPath = indexPath
        } else {
            return nil
        }
    }

    func startDownload(apiClient: APIClient = .shared) {
        requestIdentifier = apiClient.downloadImage(imageURL) { image, error in
            if let error = error {
                self.delegate?.thumbnailDownloader(self, didFinishDownloadingImage: nil, error: error)
            } else {
                OperationQueue.main.addOperation {
                    self.delegate?.thumbnailDownloader(self, didFinishDownloadingImage: image, error: error)
                }
            }
        }
    }

    func cancelDownload(apiClient: APIClient = .shared) {
        if let requestIdentifier = self.requestIdentifier {
            apiClient.cancelImageDownload(withRequestID: requestIdentifier)
        }
    }
}
