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
    let key = "089d79f78e6c30e40cbad50f2cffe433"
    let kobisDaily = KobisDailyBoxOfficeAPIRequest()
}

extension NetworkService {
    func fetch() -> DataRequest {
        guard let url = URL(string: kobisDaily.url) else { return AF.request("") }
        return AF.request(url, method: .get, parameters: kobisDaily.queryItems)
    }
}
