//
//  Debug.swift
//  kinopub
//
//  Created by Andrzej Wielski on 04.01.2023.
//

import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
