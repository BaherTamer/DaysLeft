//
//  SettingsView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import StoreKit
import SwiftUI

struct SettingsView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.requestReview) var requestReview

    var body: some View {
        NavigationStack {
            Form {
                // MARK: General Settings
                Section {
                    SettingsRow(title: "Notifications", icon: "bell.fill")

                    SettingsRow(title: "Dark Mode", icon: "moon.fill")

                    SettingsRow(title: "Screen Lock", icon: "lock.fill")
                } header: {
                    HeaderText(text: "General")
                }

                // MARK: Days Left Settings
                Section {
                    NavigationLink {
                        AboutView()
                    } label: {
                        SettingsRow(title: "About", icon: "questionmark.app.fill")
                    }


                    Button {
                        requestReview()
                    } label: {
                        HStack {
                            SettingsRow(title: "Rate", icon: "star.fill")
                            Spacer()
                            ExternalLinkIcon()
                        }
                    }

                    SettingsRow(title: "Share", icon: "square.and.arrow.up.fill")
                } header: {
                    HeaderText(text: "Days Left")
                }

                // MARK: Developer Settings
                Section {
                    Link(destination: URL(string: "https://www.linkedin.com/in/bahertamer/")!) {
                        HStack {
                            SettingsRow(title: "Follow", icon: "person.fill")
                            Spacer()
                            ExternalLinkIcon()
                        }
                    }

                    NavigationLink {
                        ContactView()
                    } label: {
                        SettingsRow(title: "Contact", icon: "paperplane.fill")
                    }

                } header: {
                    HeaderText(text: "Developer")
                }

                // MARK: Other Settings
                Section {
                    NavigationLink {
                        FakeDocumentPage(title: "Terms of Use")
                    } label: {
                        SettingsRow(title: "Terms of Use", icon: "doc.text.fill")
                    }

                    NavigationLink {
                        FakeDocumentPage(title: "Privacy Policy")
                    } label: {
                        SettingsRow(title: "Privacy Policy", icon: "checkmark.shield.fill")
                    }

                }

                SettingsFooter()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }.tint(.primary)
    }
}

struct HeaderText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.primary)
            .textCase(nil)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
