//
//  NetworkService.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import Foundation
final class NetworkService {
    private let networkManager = NetworkManager()
    func fetchServices() async throws -> [ServiceModel] {
        let data = try await networkManager.fetchData(.service)
        return try await mapData(data)
    }
    
    private func mapData(_ data: Data) async throws -> [ServiceModel] {
        let serverResponse = try JSONDecoder().decode(ServerResponse.self, from: data)
        return serverResponse.body.services
    }
   
    
}
