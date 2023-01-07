//
//  kinopubApp.swift
//  kinopub
//
//  Created by Andrzej Wielski on 21.12.2022.
//

import SwiftUI
import KinopubApi

// TODO: Not working, hide toolbar automatically on full screen
class AppDelegate: NSObject, NSApplicationDelegate {
    let window = NSWindow()
    let windowDelegate = WindowDelegate()

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApplication.shared.delegate = self
        print("AppDelegate.applicationDidFinishLaunching")
        NSApplication.shared.presentationOptions = [.autoHideToolbar, .autoHideMenuBar]

        window.styleMask = [.closable, .miniaturizable, .resizable]
        window.level = .floating
        window.delegate = windowDelegate
    }

    class WindowDelegate: NSObject, NSWindowDelegate {
        func window(_ window: NSWindow, willUseFullScreenPresentationOptions proposedOptions: NSApplication.PresentationOptions = []) -> NSApplication.PresentationOptions {
            print("WindowDelegate.window")
            return [.autoHideMenuBar, .autoHideToolbar]
        }

        func windowWillClose(_ notification: Notification) {
            NSApplication.shared.terminate(0)
        }
        
        func windowWillEnterFullScreen(_ notification: Notification) {
            //
        }
    }
}

@main
struct kinopubApp: App {
//    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var userAuth: UserAuth = UserAuth()

    init() {
        checkTokenForExpired()
        KinopubApiAPI.requestBuilderFactory = AccessTokenRequestBuilderFactory()

        let token = AuthenticationKeeper.getToken()
        if token != nil {
            userAuth.login()
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .presentedWindowToolbarStyle(.automatic)
                .frame(minWidth: 1000, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
                .environmentObject(userAuth)
                .onAppear {
//                    NSApp.presentationOptions = [.autoHideToolbar, .autoHideMenuBar]
                }
        }
    }

    func checkTokenForExpired() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 600) { // check every 10 minutes
            Task.init {
                let expiresAt = AuthenticationKeeper.getExpiresAt()
                if let expiresAt = expiresAt {
                    if expiresAt < Date() - 1800 {
                        // token will be expired in 30min
                        // refresh token
                        AuthenticationKeeper.refreshToken()
                    }
                }

                self.checkTokenForExpired()
            }
        }
    }
}
