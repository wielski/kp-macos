//
//  ContentView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 21.12.2022.
//

import SwiftUI
import CoreData
import SwiftUIRouter

struct ContentView: View {
    @EnvironmentObject private var userAuth: UserAuth

    var body: some View {
        if !userAuth.isLoggedin {
            DeviceCodeView().environmentObject(userAuth)
        }
        else {
            Router {
                MainView()
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// Preview

struct PreviewContentView: View {
    var userAuth = UserAuth();

    init() {
        userAuth.logout()
    }

    var body: some View {
        ContentView().environmentObject(userAuth)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewContentView()
    }
}
