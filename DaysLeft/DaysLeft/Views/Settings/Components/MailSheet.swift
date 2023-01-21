//
//  MailSheet.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI
import UIKit
import MessageUI

// Credit for this struct goes to https://swiftuirecipes.com/blog/send-mail-in-swiftui
typealias MailViewCallback = ((Result<MFMailComposeResult, Error>) -> Void)?

struct MailSheet: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @Binding var contactMail: ContactMail

    let callback: MailViewCallback

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var data: ContactMail

        let callback: MailViewCallback

        init(presentation: Binding<PresentationMode>,
             data: Binding<ContactMail>,
             callback: MailViewCallback) {
            _presentation = presentation
            _data = data
            self.callback = callback
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

            if let error = error {
                callback?(.failure(error))
            } else {
                callback?(.success(result))
            }

            $presentation.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(presentation: presentation, data: $contactMail, callback: callback)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailSheet>) -> MFMailComposeViewController {
        let mvc = MFMailComposeViewController()

        mvc.mailComposeDelegate = context.coordinator
        mvc.setSubject(contactMail.subject.capitalized)
        mvc.setToRecipients([contactMail.developerAddress])
        mvc.setMessageBody(contactMail.body, isHTML: false)
        mvc.accessibilityElementDidLoseFocus()

        return mvc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailSheet>) {}

    static var canSendMail: Bool {
        MFMailComposeViewController.canSendMail()
    }
}
