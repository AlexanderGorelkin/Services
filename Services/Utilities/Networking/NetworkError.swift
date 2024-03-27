//
//  NetworkError.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import Foundation
enum NetworkError: LocalizedError {
    case invalidURL
    case serverError(string: String)
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Неправильная ссылка"
        case .serverError(let string): return "Ошибка: " + string
        }
           
       }
}
