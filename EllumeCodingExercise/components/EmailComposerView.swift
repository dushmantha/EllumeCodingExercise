//
//  EmailComposerView.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import SwiftUI
import MessageUI


struct EmailComposerView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    let emailData: ComposeMailDataModel
    var result: (Result<EmailComposerResult, Error>) -> Void
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let emailComposer = MFMailComposeViewController()
        emailComposer.mailComposeDelegate = context.coordinator
        emailComposer.setSubject(emailData.subject)
        emailComposer.setToRecipients(emailData.recipients)
        emailComposer.setMessageBody(emailData.body, isHTML: false)
        if !MFMailComposeViewController.canSendMail() {
            result(.success(.deviceCannotSendEmails))
        }
        return emailComposer
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public static func canSendEmail() -> Bool {
        MFMailComposeViewController.canSendMail()
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: EmailComposerView
        
        init(_ parent: EmailComposerView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

            guard error == nil else {
                parent.result(.failure(error!))
                return
            }
            parent.result(.success((.init(rawValue: result.rawValue)!)))
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

