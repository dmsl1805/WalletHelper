import UIKit
import ChameleonFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, UINavigationControllerDelegate {
    
    var window: UIWindow?
    lazy var contextStorage: ContextStorage = {
        let model = WSDataModel()
        return model.contextStorage
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Chameleon.setGlobalThemeUsingPrimaryColor(UIColor.flatPurple(),
                                                  withSecondaryColor: UIColor(complementaryFlatColorOf: UIColor.flatPurple()),
                                                  andContentStyle: UIContentStyle.light)
        configureViewHierarchy()
//        let myCompany = [
//            "employees": [
//                "employee 1": ["attribute": "value"],
//                "employee 2": ["attribute": "value"],
//                "employee 3": ["attribute": "value"],
//                "employee 4": ["attribute": "value"],
//                "employee 5": ["attribute": "value"],
//                "employee 6": ["attribute": "value"],
//                "employee 7": ["attribute": "value"],
//                "employee 8": ["attribute": "value"],
//                "employee 9": ["attribute": "value"],
//                "employee 10": ["attribute": "value"],
//                "employee 11": ["attribute": "value"],
//                "employee 12": ["attribute": "value"],
//                "employee 13": ["attribute": "value"],
//                "employee 14": ["attribute": "value"],
//                "employee 15": ["attribute": "value"],
//                "employee 16": ["attribute": "value"],
//                "employee 17": ["attribute": "value"],
//                "employee 18": ["attribute": "value"],
//                "employee 19": ["attribute": "value"],
//                "employee 20": ["attribute": "value"],
//            ]
//        ]
        return true
    }
    
    func configureViewHierarchy() -> Void {
        let tabBar = self.window!.rootViewController as! UITabBarController
        tabBar.view.backgroundColor = UIColor.flatWhite()
        tabBar.tabBar.barTintColor = UIColor.flatWhite()
        
        tabBar.selectedIndex = 1
        let splitViewController = tabBar.viewControllers?.first as! UISplitViewController
        splitViewController.delegate = self
        let historyNavigation = splitViewController.viewControllers.first as! UINavigationController
        let historyVc = historyNavigation.viewControllers.first as! HistoryTableViewController
        historyVc.dataSource = HistoryDataSource(contextStorage: contextStorage,
                                                 reuseIdentifier: "PaymentCategoryCell")
        historyVc.contextStorage = contextStorage
        
        let chatNavigation = tabBar.viewControllers?.last as! UINavigationController
        let chatVc = chatNavigation.viewControllers.first as! ChatViewController
        chatVc.dataSource =  ChatDataSource(reuseIdentifier: "ChatCell")
        chatVc.actionsPerformer = ChatMessagingController(dataSource: chatVc.dataSource!, contextStorage: contextStorage)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        contextStorage.save()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        contextStorage.save()
    }
    
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? HistoryDetailViewController else { return false }
        guard topAsDetailController.dataSource != nil else{ return true }
        return true
    }
    
}

