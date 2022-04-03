//
//  CategoryDetailsModel.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import Foundation


struct Quote: Decodable, Hashable {
    let id : String
    let title: String
    let quote : String
    let length : String
    let author : String
    let category : String
    let language : String
    let date : String
    let permalink : String
    let background  :String
}

struct ContentsQuotes: Decodable {
    let quotes: [Quote]?
}

struct CategoryDetailsModel: Decodable {
    let success : Success
    let contents : ContentsQuotes
    
    // CodingKey isn't usefull in this case, as API return expected format
    enum CodingKeys: String, CodingKey {
        case success
        case contents
    }
}

extension CategoryDetailsModel{
    /*
     {
     "success": {
     "total": 1
     },
     "contents": {
     "quotes": [
     {
     "quote": "True art is characterized by an irresistible urge in the creative artist.",
     "length": "73",
     "author": "Albert Einstein",
     "tags": {
     "0": "art",
     "1": "artist",
     "3": "urge"
     },
     "category": "art",
     "language": "en",
     "date": "2022-04-03",
     "permalink": "https://theysaidso.com/quote/albert-einstein-true-art-is-characterized-by-an-irresistible-urge-in-the-creativ",
     "id": "tZhnMD_d4Lwoh3EaUJvP_AeF",
     "background": "https://theysaidso.com/img/qod/qod-art.jpg",
     "title": "Art quote of the day "
     }
     ]
     },
     "baseurl": "https://theysaidso.com",
     "copyright": {
     "year": 2024,
     "url": "https://theysaidso.com"
     }
     }
     */
    // Dummy data for preview.
    static let mockData: CategoryDetailsModel = {
        CategoryDetailsModel( success: Success( total: 1),contents: ContentsQuotes(quotes: [Quote(id: "tZhnMD_d4Lwoh3EaUJvP_AeF", title: "Art quote of the day ", quote: "True art is characterized by an irresistible urge in the creative artist.", length: "73", author: "Albert Einstein", category: "art", language: "en", date: "2022-04-03", permalink: "https://theysaidso.com/quote/albert-einstein-true-art-is-characterized-by-an-irresistible-urge-in-the-creativ", background: "https://theysaidso.com/img/qod/qod-art.jpg")]))}()
    
    static let emptyData: CategoryDetailsModel = {CategoryDetailsModel(success:  Success( total: 0), contents: ContentsQuotes(quotes: nil))}()
}
