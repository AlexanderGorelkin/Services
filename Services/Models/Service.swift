//
//  Service.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import Foundation
struct ServerResponse: Decodable {
    let body: Body
}
// MARK: - Body
struct Body: Decodable {
    let services: [ServiceModel]
}

// MARK: - Service
struct ServiceModel: Decodable {
    let name, description: String
    let link: String
    let iconURL: String

    enum CodingKeys: String, CodingKey {
        case name, description, link
        case iconURL = "icon_url"
    }
}



