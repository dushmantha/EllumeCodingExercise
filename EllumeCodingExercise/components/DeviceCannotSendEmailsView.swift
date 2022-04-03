//
//  EmailComposerUnableDeviceView.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import SwiftUI

struct DeviceCannotSendEmailsView: View {
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        VStack {
            Text(LocalizedStringKey("deviceCannotSendEmail.title"))
                .padding(.bottom, 20)
                .multilineTextAlignment(.center)
            Button(LocalizedStringKey("deviceCannotSendEmail.button")) {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct EmailComposerUnableDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceCannotSendEmailsView()
    }
}
