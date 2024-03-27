//
//  NetworkEndpoint.swift
//  Services
//
//  Created by Александр Горелкин on 26.03.2024.
//

import Foundation
enum NetworkEndpoint {
    case service
    case icon(url: String)
    
    private var baseURL: URL {
        switch self {
        case .service:
            return URL(string: "https://publicstorage.hb.bizmrg.com/sirius/")!
        case .icon(let url):
            return URL(string: url)!
        }
    }
    private var path: String {
        switch self {
        case .service:
            return "result.json"
        case .icon:
            return ""
        }
    }
    
    var absuluteURL: URL? {
        switch self {
        case .service:
            return baseURL.appendingPathComponent(self.path)
        case .icon:
            return baseURL
        }
        
    }
    
}
