//
//  CategoriesViewModel.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//
import Foundation

protocol CategoriesViewModel : ObservableObject {
    func fetchCategories() async
}
extension CategoryListScreen{
    @MainActor
    final class CategoriesViewModelImplementation : CategoriesViewModel {
        @Published private(set) var totalCategories: Int?
        @Published private(set) var categoryNames: [String]?
        @Published private(set) var error: Error?
        private let fetchCategoriesService : FetchCategoriesService
        
        // dependency injection
        init(fetchCategoriesService: FetchCategoriesService){
            self.fetchCategoriesService = fetchCategoriesService
        }
        
        /*
         Mathod : Fetching categories - protocol
         Params : nil
         return : nil
         */
        
        func fetchCategories() async  {
            do{
                let categories = try await fetchCategoriesService.fetchCategories()
                if categories.success.total == 0 {
                    self.totalCategories = 0
                } else {
                    // One or more categories should be in the content, if total value is > 0
                    self.categoryNames = categories.contents.categories!.map({$0.key}).sorted { $0 < $1 }
                }
            } catch{
                debugPrint("Error loading : \(String(describing: error))")
                self.error = error
            }
        }
    }
}
