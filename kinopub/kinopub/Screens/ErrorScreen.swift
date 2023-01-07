//
//  ErrorScreen.swift
//  kinopub
//
//  Created by Andrzej Wielski on 06.01.2023.
//

import SwiftUI

struct ErrorScreen: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "ladybug.fill")
                .renderingMode(.original)
                .font(.custom("bug", size: 50))

            Text("Секретная страница, на которой ничего нет")
                .font(.title)
                .fontWeight(.black)
                .multilineTextAlignment(.center)

            Text("Страшно, очень страшно. Мы не знаем, как вы сюда попали, если бы мы знали, как вы сюда попали, но мы не знаем, как вы сюда попали")
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 500)
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ErrorScreen()
    }
}
