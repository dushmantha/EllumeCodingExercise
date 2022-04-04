//
//  CategoryListScreen.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import SwiftUI

struct CategoryListScreen: View {
    @StateObject var categoriesViewModel = CategoriesViewModelImplementation(
        fetchCategoriesService: FetchCategoriesServiceImplementation()
    )
    
    var body: some View {
        VStack{
            NavigationView{
                
                // This is for the testing //
                /*
                List((CategoriesModel.mockData.contents.categories!.map({$0.key}).sorted { $0 < $1 }), id: \.self){title in
                    ZStack{
                        NavigationLink(destination: CategoryDetailsScreen(selctedCategory: title)) {
                        }
                        CateoryRow(title: title)
                    }
                }
                .navigationTitle(NSLocalizedString("category.list", comment: "Naviagation title, home screen"))
                */
                ///*
                 Group{
                 
                 if categoriesViewModel.error != nil {
                 ErrorView()
                 }  else if categoriesViewModel.categoryNames == nil && categoriesViewModel.totalCategories == nil{
                 LoadingView(text: NSLocalizedString("loading", comment: "loading data from api"))
                 } else if categoriesViewModel.totalCategories == 0 {
                 EmptyDataView()
                 } else {
                 List(categoriesViewModel.categoryNames!, id: \.self){title in
                 ZStack{
                 NavigationLink(destination: CategoryDetailsScreen(selctedCategory: title)) {
                 }
                 CateoryRow(title: title)
                 }
                 }.navigationTitle(LocalizedStringKey("category.list"))
                 }
                 }.task {
                 await categoriesViewModel.fetchCategories()
                 }.refreshable {
                 await categoriesViewModel.fetchCategories()
                 }
                 //*/
            }.navigationBarTitleDisplayMode(.large)
        }
    }
}

struct CategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListScreen()
    }
}
