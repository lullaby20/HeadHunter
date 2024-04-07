//
//  TabBarType.swift
//  HeadHunter
//
//  Created by Daniyar Merekeyev on 07.04.2024.
//

import UIKit

enum TabBarType {
    case search
    case favourite
    case reflections
    case messages
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .search
        case 1:
            self = .favourite
        case 2:
            self = .reflections
        case 3:
            self = .messages
        case 4:
            self = .profile
        default:
            return nil
        }
    }
    
    func getTitleValue() -> String {
        switch self {
        case .search:
            return "Поиск"
        case .favourite:
            return "Избранное"
        case .reflections:
            return "Отклики"
        case .messages:
            return "Сообщения"
        case .profile:
            return "Профиль"
        }
    }
    
    func getImage() -> UIImage {
        switch self {
        case .search:
            return UIImage(named: "Search")!
        case .favourite:
            return UIImage(named: "Favourite")!
        case .reflections:
            return UIImage(named: "Reflections")!
        case .messages:
            return UIImage(named: "Messages")!
        case .profile:
            return UIImage(named: "Profile")!
        }
    }
    
    func getSelectedImage() -> UIImage {
        switch self {
        case .search:
            return UIImage(named: "Search.selected")!
        case .favourite:
            return UIImage(named: "Favourite.selected")!
        case .reflections:
            return UIImage(named: "Reflections.selected")!
        case .messages:
            return UIImage(named: "Messages.selected")!
        case .profile:
            return UIImage(named: "Profile.selected")!
        }
    }
    
    func getOrderNumber() -> Int {
        switch self {
        case .search:
            return 0
        case .favourite:
            return 1
        case .reflections:
            return 2
        case .messages:
            return 3
        case .profile:
            return 4
        }
    }
}
