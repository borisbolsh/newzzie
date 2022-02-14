import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  private lazy var appDependency: AppDependency = AppDependency.makeDefault()
  private var appCoordinator: AppCoordinator?
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow(frame: UIScreen.main.bounds)
    self.appCoordinator = AppCoordinator(window: window, appDependency: self.appDependency)
    self.window = window
    self.appCoordinator?.start()
    return true

  }
  
}

