//
//  NavBarController.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import UIKit
final class NavBarController: UINavigationController {
    
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        UINavigationBar.appearance().backgroundColor = .background
        UINavigationBar.appearance().barTintColor = .background
        UINavigationBar.appearance().tintColor = .text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
