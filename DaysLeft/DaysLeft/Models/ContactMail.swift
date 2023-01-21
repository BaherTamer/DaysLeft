//
//  ContactMail.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI

enum MailSubject: String, CaseIterable {
    case inquire
    case suggestion
    case complaint
    case other
}

struct ContactMail {
    let developerAddress = "baher.appledev@gmail.com"

    let mailSubject: MailSubject
    let messageHeader: String

    var body: String {
        """
            \(messageHeader)



            --------------------------------------
            Application Name: Days Left
            iOS: \(UIDevice.current.systemVersion)
            App Version: \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
            App Build: \(Bundle.main.infoDictionary?["CFBundleVersion"] as! String)
        """
    }

    var subject: String {
        String(localized: .init(mailSubject.rawValue))
    }


    // Device Model: \(UIDevice.current.name)

    func send(openURL: OpenURLAction) {
        let urlString = "mailto:\(developerAddress)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"

        guard let url = URL(string: urlString) else { return }

        openURL(url) { accepted in
            if !accepted {
                print("This device does not support email:\n\(body)")
            }
        }
    }
}
