//
//  CategoryDetailsScreen.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import SwiftUI

struct CategoryDetailsScreen: View {
    
    @StateObject var categoryDetailsViewModel = CategoryDetailsViewModelImplementation(
        fetchCategoryDetailsService: FetchCategoryDetailsServiceImplementation()
    )
    let selctedCategory : String
    
    var body: some View {
        VStack{
            // /*
            // This is for testing
            List(CategoryDetailsModel.mockData.contents.quotes!, id: \.self){ quote in
                CategoryDetailsRow(quote: quote)
            } .navigationTitle(selctedCategory)
            //*/
            
            /*
             Group{
             if categoryDetailsViewModel.error != nil {
             ErrorView()
             }  else if categoryDetailsViewModel.quotes == nil && categoryDetailsViewModel.totalQuotes == nil {
             LoadingView(text: NSLocalizedString("loading", comment: "loading data from api"))
             } else if categoryDetailsViewModel.totalQuotes == 0 {
             EmptyDataView()
             } else {
             List(categoryDetailsViewModel.quotes!, id: \.self){quote in
             CategoryDetailsRow(quote: quote)
             }
             }
             }.task {
             await categoryDetailsViewModel.fetchCategoryDetails(queryParam: selctedCategory)
             }.refreshable {
             await categoryDetailsViewModel.fetchCategoryDetails(queryParam: selctedCategory)
             }
             */
        }
    }
}

struct CategoryDetails_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsScreen( selctedCategory: "management")
    }
}

