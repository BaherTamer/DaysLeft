//
//  ContactView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI

struct ContactView: View {
    @State private var mail = ContactMail(mailSubject: .other, messageHeader: "")
    @State private var isShowingMailSheet: Bool = false

    var body: some View {
        Form {
            ForEach(MailSubject.allCases, id: \.self) { subject in
                Button {
                    if MailSheet.canSendMail {
                        mail = ContactMail(mailSubject: subject, messageHeader: "")
                        isShowingMailSheet.toggle()
                    }
                } label: {
                    HStack {
                        Text(subject.rawValue.capitalized)
                        Spacer()
                        Image(systemName: "arrow.up")
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                }

            }
        }
        .navigationTitle("Contact")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isShowingMailSheet) {
            MailSheet(contactMail: $mail) { error in
                print(error)
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactView()
        }
    }
}
