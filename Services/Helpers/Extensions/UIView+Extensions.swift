//
//  UIView+Extensions.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import UIKit
extension UIView {
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
