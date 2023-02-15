//
//  APIRequest.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/15.
//

import Foundation

protocol APIRequestProtocol {
    var host: URLHost { get }
    var path: URLPath { get }
    var queryItems: [String: String]? { get }
    var httpMethod: HTTPMethod { get }
    var header: [String : String]? { get }
    var body: Data? { get }
}

extension APIRequestProtocol {
    var url: String {
        return host.url + path.type
    }
}
