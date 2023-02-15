//
//  URLPath.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/15.
//

import Foundation

enum URLPath {
    case dailyBoxOfficeList
    case weeklyBoxOfficeList
    case moviewInfo

    var type: String {
        switch self {
        case .dailyBoxOfficeList:
            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        case .weeklyBoxOfficeList:
            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        case .moviewInfo:
            return "/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
        }
    }
}
