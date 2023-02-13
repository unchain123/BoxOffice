//
//  BoxOfficeResultParsingTests.swift
//  BoxOfficeResultParsingTests
//
//  Created by unchain on 2023/02/13.
//

import XCTest
@testable import CleanBoxOffice

final class BoxOfficeResultParsingTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testParsing() {
        //given
        guard let data = NSDataAsset(name: "boxOfficeSample")?.data else { return }
        guard let decodeData = try? JSONDecoder().decode([BoxOfficeList].self, from: data) else { return }

        //when
        let rnum = 1

        //then
        XCTAssertEqual(rnum, decodeData.first?.rnum)
    }

    func test_showRange_parsing() {
        //given
        guard let data = NSDataAsset(name: "boxOfficeSample")?.data else { return }
        guard let decodeData = try? JSONDecoder().decode(BoxOfficeResult.self, from: data) else { return }

        //when
        let rnum = "20220105~20220105"

        //then
        XCTAssertEqual(rnum, decodeData.showRange)
    }
}
