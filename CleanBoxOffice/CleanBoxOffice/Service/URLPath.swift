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
    case movieInfo

    var type: String {
        switch self {
        case .dailyBoxOfficeList:
            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        case .weeklyBoxOfficeList:
            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        case .movieInfo:
            return "/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
        }
    }
}
