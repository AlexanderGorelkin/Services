//
//  Alamofire+Extensions.swift
//  Services
//
//  Created by Александр Горелкин on 27.03.2024.
//

import Alamofire
import Foundation
extension Alamofire.Session {
    @discardableResult
    public func requestWithoutCache(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil) -> DataRequest {
            do {
                var urlRequest = try URLRequest(url: url, method: method, headers: headers)
                urlRequest.cachePolicy = .reloadIgnoringCacheData // <<== Cache disabled
                let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
                return request(encodedURLRequest)
            } catch {
                // TODO: find a better way to handle error
                print(error)
                return request(URLRequest(url: URL(string: "http://example.com/wrong_request")!))
            }
        }
}
