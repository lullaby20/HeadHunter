//
//  TabBarCoordinator.swift
//  HeadHunter
//
//  Created by Daniyar Merekeyev on 07.04.2024.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectTab(_ tab: TabBarType)
    func setSelectedTabIndex(_ index: Int)
    func currentTab() -> TabBarType?
}

class TabBarCoordinator: NSObject, TabBarCoordinatorProtocol {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var tabBarController: UITabBarController
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        let tabs: [TabBarType] = [.main, .settings]
        let controllers: [UINavigationController] = tabs.map { getTabController($0) }
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    func selectTab(_ tab: TabBarType) {
        tabBarController.selectedIndex = tab.tabOrderNumber()
    }
    
    func setSelectedTabIndex(_ index: Int) {
        guard let tab = TabBarType.init(index: index) else { return }
        tabBarController.selectedIndex = tab.tabOrderNumber()
    }
    
    func currentTab() -> TabBarType? {
        TabBarType.init(index: tabBarController.selectedIndex)
    }
    
    private func prepareTabBarController(withTabControllers tabcontrollers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabcontrollers, animated: true)
        tabBarController.selectedIndex = TabBarType.main.tabOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ tab: TabBarType) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.tabBarItem = UITabBarItem(title: tab.tabTitleValue(), image: nil, tag: tab.tabOrderNumber())
        
        switch tab {
        case .main:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .cyan
            
            navController.pushViewController(viewController, animated: true)
        case .settings:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .green
            
            navController.pushViewController(viewController, animated: true)
        }
        
        return navController
    }
}

extension TabBarCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //
    }
}
