//
//  TabBarType.swift
//  HeadHunter
//
//  Created by Daniyar Merekeyev on 07.04.2024.
//

enum TabBarType {
    case main
    case settings
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .settings
        default:
            return nil
        }
    }
    
    func tabTitleValue() -> String {
        switch self {
        case .main:
            return "Main"
        case .settings:
            return "Settings"
        }
    }
    
    func tabOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .settings:
            return 1
        }
    }
}
