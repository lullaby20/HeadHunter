//
//  ReflectionsViewController.swift
//  HeadHunter
//
//  Created by Daniyar Merekeyev on 07.04.2024.
//

import UIKit

final class ReflectionsViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = ReflectionsView()
        configureSwiftUIViewAsChild(view: view)
    }
}

extension ReflectionsViewController: SwiftUIWrapper {}