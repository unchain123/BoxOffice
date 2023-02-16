//
//  MovieDetail.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/16.
//

import Foundation

struct MovieInfoReponse: Decodable {
    let movieInformation: MovieInformationResult

    private enum CodingKeys: String, CodingKey {
        case movieInformation = "movieInfoResult"
    }
}

struct MovieInformationResult: Decodable {
    let movieDetail: MovieDetail

    private enum CodingKeys: String, CodingKey {
        case movieDetail = "movieInfo"
    }
}

struct MovieDetail: Decodable {
    let movieCode: String
    let movieName: String
    let movieEnglishName: String
    let showTime: String
    let ProductionYear: String
    let openDate: String //개봉연도
    let productionName: String //제작상태
    let typeName: String
    let nations: [Country]
    let genres: [Genre]
    let directors: [Director]
    let actors: [Actor]
    let showTypes: [ShowType]
    let companies: [Company]
    let audits: [Audit]
    let staffs: [Staff]

    private enum CodingKeys: String, CodingKey {
        case movieCode = "movieCd"
        case movieName = "movieNm"
        case movieEnglishName = "movieNmEn"
        case showTime = "showTm"
        case ProductionYear = "prdtYear"
        case openDate = "openDt"
        case productionName = "prdtStatNm"
        case typeName = "typeNm"
        case nations
        case genres = "genreNm"
        case directors = "directors"
        case actors
        case showTypes = "showTypeNm"
        case companies = "companys"
        case audits
        case staffs
    }
}

struct Country: Decodable {
    let nationName: String

    private enum CodingKeys: String, CodingKey {
        case nationName = "nationNm"
    }
}

struct Genre: Decodable {
    let genreName: String

    private enum CodingKeys: String, CodingKey {
        case genreName = "genreNM"
    }
}

struct Director: Decodable {
    let peopleName: String
    let peopleEnglishName: String

    private enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case peopleEnglishName = "peopleNmEn"
    }
}

struct `Actor`: Decodable {
    let peopleName: String
    let peopleEnglishName: String
    let cast: String
    let castEnglishName: String

    private enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case peopleEnglishName = "peopleNmEn"
        case cast
        case castEnglishName = "castEn"
    }
}

struct ShowType: Decodable {
    let showTypeGroupName: String
    let showTypeName: String

    private enum CodingKeys: String, CodingKey {
        case showTypeGroupName = "showTypeGroupNm"
        case showTypeName = "showTypeNm"
    }
}

struct Company: Decodable {
    let companyCode: String
    let companyName: String
    let companyEnglishName: String
    let companyPartName: String

    private enum CodingKeys: String, CodingKey {
        case companyCode = "companyCd"
        case companyName = "companyNm"
        case companyEnglishName = "companyNmEn"
        case companyPartName = "companyPartNm"
    }
}

struct Audit: Decodable {
    let auditNumber: String
    let watchGradeName: String

    private enum CodingKeys: String, CodingKey {
        case auditNumber = "auditNo"
        case watchGradeName = "watchGradeNm"
    }
}

struct Staff: Decodable {
    let peopleName: String
    let peopleEnglishName: String
    let staffeRoleName: String

    private enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case peopleEnglishName = "peopleNmEn"
        case staffeRoleName = "staffRoleNm"
    }
}
