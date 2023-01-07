//
//  MainView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 03.01.2023.
//

import SwiftUI
import SwiftUIRouter

struct MainView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var sidebarSettings = SidebarSettings()

    var body: some View {
        NavigationView {
            SidebarView()
                .background(
                    SidebarAccessor(sideCollapsed: $sidebarSettings.collapsed)
                )
            RouterView()
                .environmentObject(sidebarSettings)
        }
        .toolbar {
            toolbars()
        }
        .navigationTitle("")
        .presentedWindowStyle(.hiddenTitleBar)
    }

    @ToolbarContentBuilder
    func toolbars() -> some ToolbarContent {
        ToolbarItem(placement: .navigation) {
            Button(action: toggleSidebar, label: { // 1
                Image(systemName: "sidebar.leading")
            })
            .disabled(!sidebarSettings.allowOpen)
        }

        ToolbarItem(placement: .navigation) {
            Button(action: {
                navigator.goBack()
            }) {
                Image(systemName: "chevron.left")
            }
            .disabled(!navigator.canGoBack)
        }

        ToolbarItem(placement: .navigation) {
            Button(action: {
                navigator.goForward()
            }) {
                Image(systemName: "chevron.right")
            }
            .disabled(!navigator.canGoForward)
        }

        ToolbarItem(placement: .primaryAction) {
            HStack {
                Text("891 день")

                Divider()

                Image(systemName: "chevron.down")
                    .foregroundColor(.secondary)
            }
            .foregroundColor(.secondary)
        }

        ToolbarItem(placement: .primaryAction) {
            Button(action: { }) {
                Image(systemName: "gearshape")
            }
        }
    }

    private func toggleSidebar() {
        SidebarAccessor.toggleSidebar()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
