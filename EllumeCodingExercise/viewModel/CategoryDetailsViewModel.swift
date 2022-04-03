//
//  CategoryDetailsViewModel.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//


import Foundation


protocol CategoryDetailsViewModel : ObservableObject {
    func fetchCategoryDetails(queryParam : String) async
}

extension CategoryDetailsScreen{
    @MainActor
    final class CategoryDetailsViewModelImplementation : CategoryDetailsViewModel {
        @Published private(set) var quotes: [Quote]?
        @Published private(set) var totalQuotes: Int?
        @Published private(set) var error: Error?
        private let fetchCategoryDetailsService : FetchCategoryDetailsService
        
        // dependency injection
        init(fetchCategoryDetailsService: FetchCategoryDetailsService){
            self.fetchCategoryDetailsService = fetchCategoryDetailsService
        }
        
        /*
         Mathod : Fetching category details - protocol
         Params : QueryParam is a category name
         return : nil
         */
        func fetchCategoryDetails(queryParam : String) async  {
            do{
                let categoriesModel = try await fetchCategoryDetailsService.fetchCategoryDetails(queryParam: queryParam)
                if categoriesModel.success.total == 0 {
                    self.totalQuotes = 0
                } else {
                    self.quotes = categoriesModel.contents.quotes
                }
            } catch{
                debugPrint("Error loading : \(String(describing: error))")
                self.error = error
            }
        }
    }
}
