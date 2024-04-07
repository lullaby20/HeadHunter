//
//  SearchViewController.swift
//  HeadHunter
//
//  Created by Daniyar Merekeyev on 07.04.2024.
//

import UIKit

final class SearchViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = SearchView()
        configureSwiftUIViewAsChild(view: view)
    }
}

extension SearchViewController: SwiftUIWrapper {}
