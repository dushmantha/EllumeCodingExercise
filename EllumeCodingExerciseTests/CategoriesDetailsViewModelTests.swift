//
//  CategoriesDetailsViewModelTests.swift
//  EllumeCodingExerciseTests
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import XCTest
@testable import EllumeCodingExercise

class MockDataCategoryDetails: FetchCategoryDetailsService {
    func fetchCategoryDetails(queryParam: String) async throws -> CategoryDetailsModel {
        return CategoryDetailsModel.mockData
    }
}

class EmptyMockDataCategoryDetails: FetchCategoryDetailsService {
    func fetchCategoryDetails(queryParam: String) async throws -> CategoryDetailsModel {
        return CategoryDetailsModel.emptyData
    }
}

class ErrorMockDataCategoryDetails: FetchCategoryDetailsService {
    func fetchCategoryDetails(queryParam: String) async throws -> CategoryDetailsModel {
        throw URLError(.badServerResponse)
    }
}

class CategoriesDetailsViewModelTests: XCTestCase {

    var viewModel: CategoryDetailsScreen.CategoryDetailsViewModelImplementation!
    var emptyViewModel : CategoryDetailsScreen.CategoryDetailsViewModelImplementation!
    var errorViewModel : CategoryDetailsScreen.CategoryDetailsViewModelImplementation!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CategoryDetailsScreen.CategoryDetailsViewModelImplementation(fetchCategoryDetailsService: MockDataCategoryDetails())
        emptyViewModel = CategoryDetailsScreen.CategoryDetailsViewModelImplementation(fetchCategoryDetailsService: EmptyMockDataCategoryDetails())
        errorViewModel = CategoryDetailsScreen.CategoryDetailsViewModelImplementation(fetchCategoryDetailsService: ErrorMockDataCategoryDetails())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        emptyViewModel = nil
        errorViewModel = nil
    }

    @MainActor  func testEmptyCategoryDetails() async throws {
        await emptyViewModel.fetchCategoryDetails(queryParam: "art")
        XCTAssertEqual(emptyViewModel.totalQuotes, 0)
        XCTAssertNil(emptyViewModel.quotes, "Category names are nil")
    }
    
    @MainActor  func testCategoryDetails() async throws {
        await viewModel.fetchCategoryDetails(queryParam: "art")
        XCTAssertEqual(viewModel.quotes?.count, 1)
        XCTAssertNil(viewModel.totalQuotes, "Total category does not update from API value")
        
    }
    
    @MainActor  func testErrorCategory() async throws {
        await errorViewModel.fetchCategoryDetails(queryParam: "art")
        XCTAssertNil(errorViewModel.quotes, "Category names do not update from API value")
        XCTAssertNil(errorViewModel.totalQuotes, "Total category does not update from API value")
        XCTAssertTrue(errorViewModel.error != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
