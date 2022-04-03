//
//  RouterTests.swift
//  EllumeCodingExerciseTests
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import XCTest
@testable import EllumeCodingExercise


class RouterTests: XCTestCase {
    let router = Router()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUrlRequest() throws {
        let urlRequestCategory =  try router.asURLRequest(endPoint: .categories, queryParam: "")
        let urlRequestCategoryDetails =  try router.asURLRequest(endPoint: .categoryDetails, queryParam: "art")
        
        XCTAssertEqual(urlRequestCategory.url?.absoluteString, "https://quotes.rest/qod/categories.json")
        XCTAssertEqual(urlRequestCategory.httpMethod, "GET")
        
        XCTAssertEqual(urlRequestCategoryDetails.url?.absoluteString, "https://quotes.rest/qod.json?category=art")
        XCTAssertEqual(urlRequestCategoryDetails.httpMethod, "GET")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
