//
//  RemoteImageUrl.swift
//  kinopub
//
//  Created by Andrzej Wielski on 02.01.2023.
//

import Foundation

class RemoteImageURL: ObservableObject {
    @Published var data = Data()
    @Published var isLoaded = false
    
    // load our image URL
    init(imageURL: String) {
        guard let url = URL(string: imageURL.replacingOccurrences(of: "http://", with: "https://")) else {
            print("Invalid URL")
            return
        }
      
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let _ = response {
                DispatchQueue.main.async {
                    self.data = data
                    self.isLoaded = true
                }
            }
        }.resume()
    }
}
