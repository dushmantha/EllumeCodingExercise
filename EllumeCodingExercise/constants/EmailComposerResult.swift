//
//  EmailComposerResult.swift
//  EllumeCodingExercise
//
//  Created by Tharaka Dushmantha on 3/04/22.
//

import Foundation

public enum EmailComposerResult: Int, CustomStringConvertible {
    case cancelled
    case saved
    case sent
    case failed
    case deviceCannotSendEmails
    
    public var description: String {
        switch self {
        case .cancelled: return NSLocalizedString("cancelled", comment: "User close mail composer")
        case .saved: return NSLocalizedString("saved", comment: "User save mail")
        case .sent: return NSLocalizedString("sent", comment: "mail has been sent")
        case .failed: return NSLocalizedString("failed", comment: "sent faild")
        case .deviceCannotSendEmails: return NSLocalizedString("deviceNotSupport", comment: "User cann't send email from this device")
        }
    }
}
