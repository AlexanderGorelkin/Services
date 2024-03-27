//
//  NetworkManager.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//
import Foundation
import Alamofire
final class NetworkManager {
    
    func fetchData(_ endpoint: NetworkEndpoint) async throws -> Data {
        guard let url = endpoint.absuluteURL else { throw NetworkError.invalidURL }
        return try await withUnsafeThrowingContinuation { continuation in
            AF
                .requestWithoutCache(url, method: .get)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data): continuation.resume(returning: data)
                    case .failure(let error): continuation.resume(throwing: error)
                    }
                }
        }
    }
}
//requestModifier: { $0.timeoutInterval = 15 }
