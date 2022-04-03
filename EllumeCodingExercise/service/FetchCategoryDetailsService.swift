//
//  FetchCategoryDetailsService.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import Foundation

protocol FetchCategoryDetailsService {
    func fetchCategoryDetails(queryParam : String) async throws ->CategoryDetailsModel
}

struct FetchCategoryDetailsServiceImplementation : FetchCategoryDetailsService {
    let router  = Router()
    
    /*
     Mathod : fetching category details
     Params : queryParam - appending params component of url
     return : Data decode from category details data response
     */
    func fetchCategoryDetails(queryParam : String) async throws -> CategoryDetailsModel {
        guard let decodedResponse = try? await JSONDecoder().decode(CategoryDetailsModel.self, from: router.fetch(endPoint: .categoryDetails, queryParam: queryParam))
        else { throw ServiceError.decoderError() }
        return decodedResponse
    }
}
