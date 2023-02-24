//
//  MovieDetailAPIRequest.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/16.
//

import Foundation

struct MovieDetailAPIRequest: APIRequestProtocol {
    var queryItems: [String : String]?
    

    let movieCode: String

    var host: URLHost {
        .kobis
    }

    var path: URLPath {
        .movieInfo
    }

//    var queryItems: [String : String]? {
//        [
//            "key" : "089d79f78e6c30e40cbad50f2cffe433",
//            "movieCd" : movieCode
//        ]
//    }

    var httpMethod: HTTPMethod {
        .get
    }
    var header: [String : String]?
    var body: Data?

    init(movieCode: String) {
        self.movieCode = movieCode
    }
}
