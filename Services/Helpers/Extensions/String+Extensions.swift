//
//  String+Extensions.swift
//  Services
//
//  Created by Александр Горелкин on 27.03.2024.
//

import Foundation
extension String {
    func fromURLToString() -> String {
        if let url = URL(string: self) {
            return url.lastPathComponent
        }
        return ""
    }
}
