//
//  SwiftUIWrapper.swift
//  HeadHunter
//
//  Created by Daniyar Merekeyev on 07.04.2024.
//

import UIKit
import SwiftUI

protocol SwiftUIWrapper: AnyObject {
    func configureSwiftUIViewAsChild(view: some View, safeAreaEdges: [Edge])
}

extension SwiftUIWrapper where Self: UIViewController {
    func configureSwiftUIViewAsChild(view: some View, safeAreaEdges: [Edge] = []) {
        let viewController = UIHostingController(rootView: view)
        addChild(viewController)
        self.view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        let topAnchor: NSLayoutConstraint
        if safeAreaEdges.contains(.top) {
            topAnchor = viewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        } else {
            topAnchor = viewController.view.topAnchor.constraint(equalTo: self.view.topAnchor)
        }
        
        let bottomAnchor: NSLayoutConstraint
        if safeAreaEdges.contains(.bottom) {
            bottomAnchor = viewController.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        } else {
            bottomAnchor = viewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        }
        
        let leadingAnchor: NSLayoutConstraint
        if safeAreaEdges.contains(.leading) {
            leadingAnchor = viewController.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        } else {
            leadingAnchor = viewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        }
        
        let trailingAnchor: NSLayoutConstraint
        if safeAreaEdges.contains(.trailing) {
            trailingAnchor = viewController.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        } else {
            trailingAnchor = viewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        }
        
        NSLayoutConstraint.activate([
            leadingAnchor,
            trailingAnchor,
            topAnchor,
            bottomAnchor
        ])
    }
}
