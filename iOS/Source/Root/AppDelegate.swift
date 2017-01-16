import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.regular(size: 17)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont.bold(size: 17)], for: .normal)

        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { fatalError("Window not found") }

        let navigationController = UINavigationController(rootViewController: RecipesController())
        navigationController.navigationBar.tintColor = UIColor.brandColor
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.medium(size: 17)]

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return true
    }
}
