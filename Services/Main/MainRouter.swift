//
//  MainRouter.swift
//  Super easy dev
//
//  Created by Александр Горелкин on 26.03.2024
//

import UIKit

protocol MainRouterProtocol {
    func openApp(link: String)
}

class MainRouter: MainRouterProtocol {
    weak var viewController: MainViewController?
    
    func openApp(link: String) {
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
}
