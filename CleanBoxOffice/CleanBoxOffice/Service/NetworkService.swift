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
    private var kobisDaily = KobisDailyBoxOfficeAPIRequest()
}

extension NetworkService {
    func fetch(targetDate: String) -> DataRequest {
        guard let url = URL(string: kobisDaily.url) else { return AF.request("") }
        kobisDaily.queryItems?["targetDt"] = targetDate
        return AF.request(url, method: .get, parameters: kobisDaily.queryItems)
    }
}
