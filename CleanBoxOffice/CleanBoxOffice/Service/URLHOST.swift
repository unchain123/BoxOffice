//
//  URLHost.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/15.
//

import Foundation

enum URLHost {
    case kobis

    var url: String {
        switch self {
        case .kobis:
            return "https://www.kobis.or.kr"
        }
    }
}
