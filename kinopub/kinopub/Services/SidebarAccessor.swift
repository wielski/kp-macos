//
//  SidebarAccessor.swift
//  kinopub
//
//  Created by Andrzej Wielski on 05.01.2023.
//

import Foundation
import SwiftUI

class SidebarSettings: ObservableObject {
    @Published var collapsed = false
    @Published var allowOpen = true
    @Published var toolbarOpened = true

    func disableSidebar() {
        self.allowOpen = false
    }

    func enableSidebar() {
        self.allowOpen = true
    }
}

struct SidebarAccessor: NSViewRepresentable {
    @Binding var sideCollapsed: Bool
    
    static func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(
            #selector(NSSplitViewController.toggleSidebar(_:)),
            with: nil
        )
    }

    func makeNSView(context: Context) -> some NSView {
      let view = MyView()
      view.sideCollapsed = _sideCollapsed
      return view
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
    }

    class MyView: NSView {
        var sideCollapsed: Binding<Bool>?

        weak private var controller: NSSplitViewController?
        private var observer: Any?

        override func viewDidMoveToWindow() {
            super.viewDidMoveToWindow()
            setObserver()
        }

        private func setObserver() {
            var sview = self.superview

            while sview != nil, !sview!.isKind(of: NSSplitView.self) {
                sview = sview?.superview
            }
            guard let sview = sview as? NSSplitView else { return }
            
            controller = sview.delegate as? NSSplitViewController
            if let sidebar = controller?.splitViewItems.first {
                self.sideCollapsed?.wrappedValue = sidebar.isCollapsed
                observer = sidebar.observe(\.isCollapsed, options: [.new]) { [weak self] _, change in
                    if let value = change.newValue {
                        self?.sideCollapsed?.wrappedValue = value
                    }
                }
            }
        }
    }
}
