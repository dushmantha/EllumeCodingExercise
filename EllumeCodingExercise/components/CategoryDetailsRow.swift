//
//  CategoryDetailsRow.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import SwiftUI

struct CategoryDetailsRow: View {
    let quote: Quote
    @State private var showMailView = false
    
    var body: some View {
        VStack{
            Text(quote.title).font(.title2) .frame(maxWidth: .infinity, alignment: .center).padding(.vertical)
            Text(quote.quote).font(.body) .frame(maxWidth: .infinity, alignment: .leading).padding(.vertical)
            HStack{
                Text(createAttributedString(title: NSLocalizedString("author", comment: "Author label"), label: quote.author))
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.vertical)
            HStack{
                Spacer()
                Button(action: {
                    showMailView.toggle()
                }) {
                    Text(LocalizedStringKey("sendEmail.button")).bold()
                }
                .sheet(isPresented: $showMailView) {
                    if EmailComposerView.canSendEmail() {
                        EmailComposerView(emailData:  ComposeMailDataModel(subject: quote.title, recipients: [""], body: "\(quote.quote) \n\n \(NSLocalizedString("author", comment: "Author label")) \(quote.author)")) { result in
                            print(result)
                        }
                    } else {
                        DeviceCannotSendEmailsView()
                    }
                }
                .buttonStyle(GrowingButton())
            }
        }
    }
}

struct CategoryDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsRow(quote: (CategoryDetailsModel.mockData.contents.quotes?.first)!)
    }
}
