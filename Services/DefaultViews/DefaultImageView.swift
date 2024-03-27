//
//  DefaultImageView.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import Foundation
import UIKit
final class DefaultImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        self.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
