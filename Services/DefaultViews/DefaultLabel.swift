//
//  DefaultLabel.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import UIKit
final class DefaultLabel: UILabel {
    init(text: String = "",
         font: UIFont = .systemFont(ofSize: 12),
         textAligmanet: NSTextAlignment = .center) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = UIColor.text
        self.textAlignment = textAligmanet
        self.numberOfLines = 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
