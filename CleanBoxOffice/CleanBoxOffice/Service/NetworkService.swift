//
//  NetworkService.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/13.
//

import Foundation
import Alamofire


final class NetworkService {
    static let shared = NetworkService()
    private init() {}
    let kobisDaily = KobisDailyBoxOfficeAPIRequest()
}

extension NetworkService {
    func fetch() -> DataRequest {
        guard let url = URL(string: kobisDaily.url) else { return AF.request("") }
        return AF.request(url, method: .get, parameters: kobisDaily.queryItems)
    }
}
