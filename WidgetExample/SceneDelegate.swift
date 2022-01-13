import UIKit
import EOFoundation
import TestWidget

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        WidgetsManager.shared.register(widget: widget())
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        AppCoordinator.window = window
        AppCoordinator.isInSandbox = true
        AppCoordinator.moveToMain(reload: true)
    }
}
