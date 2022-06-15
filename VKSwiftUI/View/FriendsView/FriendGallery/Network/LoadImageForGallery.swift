//
//  LoadImageForGallery.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 15.06.22.
//

import SwiftUI

class LoadImageForGallery: ObservableObject {

    @Published var image: Image = Image(systemName: "pencil.slash")

    init(_ url: String) {
        loadImage2(url: url)
    }

    private var session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()

    func loadImage2(url: String) {
        guard let newUrl = URL(string: url) else { return }

        session.dataTask(with: newUrl, completionHandler: { data, response, error in
            guard let responseData = data,
                    error == nil,
                    let uiImage = UIImage(data: responseData) else {
                print("ERROR")
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
                self.objectWillChange.send()
            }
        }).resume()
    }
}
