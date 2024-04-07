//
//  MessagesViewController.swift
//  HeadHunter
//
//  Created by Daniyar Merekeyev on 07.04.2024.
//

import UIKit

final class MessagesViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = MessagesView()
        configureSwiftUIViewAsChild(view: view)
    }
}

extension MessagesViewController: SwiftUIWrapper {}
