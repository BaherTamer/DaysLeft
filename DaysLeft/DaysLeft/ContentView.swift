//
//  ContentView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var isShowingSettingsView: Bool = false
    @State private var isShowingAddEventView: Bool = false

    var body: some View {
        NavigationStack {
            EventsListView()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            self.isShowingSettingsView.toggle()
                        } label: {
                            Image(systemName: "gear")
                        }
                        .tint(.primary)
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.isShowingAddEventView.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .tint(.primary)
                    }
                }
                .sheet(isPresented: $isShowingSettingsView) {
                    SettingsView()
                }
                .sheet(isPresented: $isShowingAddEventView) {
                    AddEventView()
                }
        }
        .tint(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
