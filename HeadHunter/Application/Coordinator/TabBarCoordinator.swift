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
        let tabs: [TabBarType] = [.search, .favourite, .reflections, .messages, .profile]
        let controllers: [UINavigationController] = tabs.map { getTabController($0) }
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    func selectTab(_ tab: TabBarType) {
        tabBarController.selectedIndex = tab.getOrderNumber()
    }
    
    func setSelectedTabIndex(_ index: Int) {
        guard let tab = TabBarType.init(index: index) else { return }
        tabBarController.selectedIndex = tab.getOrderNumber()
    }
    
    func currentTab() -> TabBarType? {
        TabBarType.init(index: tabBarController.selectedIndex)
    }
    
    private func prepareTabBarController(withTabControllers tabcontrollers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabcontrollers, animated: true)
        tabBarController.selectedIndex = TabBarType.search.getOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.tintColor = .specialBlue
        
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ tab: TabBarType) -> UINavigationController {
        let navController = UINavigationController()
        configureTabBarItem(navController, tab: tab)
        
        switch tab {
        case .search:
            let searchCoordinator = SearchCoordinator(navController)
            searchCoordinator.start()
            childCoordinators.append(searchCoordinator)
        case .favourite:
            let favouriteCoordinator = FavouriteCoordinator(navController)
            favouriteCoordinator.start()
            childCoordinators.append(favouriteCoordinator)
        case .reflections:
            let reflectionsCoordinator = ReflectionCoordinator(navController)
            reflectionsCoordinator.start()
            childCoordinators.append(reflectionsCoordinator)
        case .messages:
            let messagesCoordinator = MessagesCoordinator(navController)
            messagesCoordinator.start()
            childCoordinators.append(messagesCoordinator)
        case .profile:
            let profileCoordinator = ProfileCoordinator(navController)
            profileCoordinator.start()
            childCoordinators.append(profileCoordinator)
        }
        
        return navController
    }
    
    private func configureTabBarItem(_ navigationController: UINavigationController, tab: TabBarType) {
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.tabBarItem = UITabBarItem(title: tab.getTitleValue(),
                                                image: tab.getImage(),
                                                tag: tab.getOrderNumber())
    }
}

extension TabBarCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //
    }
}
