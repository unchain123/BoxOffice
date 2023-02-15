//
//  HTTPMethod.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/15.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    case delete
    case patch

    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        case .patch:
            return "PATCH"
        }
    }
}
