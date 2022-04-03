//
//  CategoryRow.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import SwiftUI

struct CateoryRow: View {
    let title : String
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(title).font(.title3) .frame(maxWidth: .infinity, alignment: .leading)
        }.padding()
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CateoryRow(title: "management")
    }
}
