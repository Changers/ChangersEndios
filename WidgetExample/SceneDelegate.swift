import UIKit
import EOFoundation
import WidgetChangers

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        WidgetsManager.shared.register(widget: changersWidget())
        WidgetsManager.shared.register(widget: changersMarketplaceWidget())
        WidgetsManager.shared.register(widget: changersTreeWidget())
        WidgetsManager.shared.register(widget: changersStatisticWidget())
        WidgetsManager.shared.register(widget: changersClimateCoinWidget())
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        AppCoordinator.window = window
        AppCoordinator.isInSandbox = true
        AppCoordinator.moveToMain(reload: true)
    }
}
