//
//  CategoriesViewModelTests.swift
//  EllumeCodingExerciseTests
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import XCTest

@testable import EllumeCodingExercise

class MockDataCategory: FetchCategoriesService {
    func fetchCategories() async throws -> CategoriesModel {
        return CategoriesModel.mockData
    }
}

class EmptyMockDataCategory: FetchCategoriesService {
    func fetchCategories() async throws -> CategoriesModel {
        return CategoriesModel.emptyData
    }
}

class ErrorMockDataCategory: FetchCategoriesService {
    func fetchCategories() async throws -> CategoriesModel {
        throw URLError(.badServerResponse)
    }
}

class CategoriesViewModelTests: XCTestCase {

    var viewModel: CategoryListScreen.CategoriesViewModelImplementation!
    var emptyViewModel : CategoryListScreen.CategoriesViewModelImplementation!
    var errorViewModel : CategoryListScreen.CategoriesViewModelImplementation!
    @MainActor override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CategoryListScreen.CategoriesViewModelImplementation(fetchCategoriesService: MockDataCategory())
        emptyViewModel = CategoryListScreen.CategoriesViewModelImplementation(fetchCategoriesService: EmptyMockDataCategory())
        errorViewModel = CategoryListScreen.CategoriesViewModelImplementation(fetchCategoriesService: ErrorMockDataCategory())
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        emptyViewModel = nil
        errorViewModel = nil
    }
    
    @MainActor  func testEmptyCategory() async throws {
        await emptyViewModel.fetchCategories()
        XCTAssertEqual(emptyViewModel.totalCategories, 0)
        XCTAssertNil(emptyViewModel.categoryNames, "Category names are nil")
    }
    
    @MainActor  func testCategory() async throws {
        await viewModel.fetchCategories()
        XCTAssertEqual(viewModel.categoryNames?.count, 8)
        XCTAssertNil(viewModel.totalCategories, "Total category does update from API value")
        // testing sorted value
        XCTAssertEqual(viewModel.categoryNames?.first, "art", "They are not equal")
    }
    
    @MainActor  func testErrorCategory() async throws {
        await errorViewModel.fetchCategories()
        XCTAssertNil(errorViewModel.categoryNames, "Category names do update from API value")
        XCTAssertNil(errorViewModel.totalCategories, "Total category not update from API value")
        XCTAssertTrue(errorViewModel.error != nil)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
