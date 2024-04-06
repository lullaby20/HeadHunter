//
//  AppCoordinator.swift
//  HeadHunter
//
//  Created by Daniyar Merekeyev on 07.04.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        let tabCoordinator = TabBarCoordinator(navigationController)
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}
