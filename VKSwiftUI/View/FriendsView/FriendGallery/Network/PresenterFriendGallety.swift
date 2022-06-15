////
////  PresenterFriendGallety.swift
////  VKSwiftUI
////
////  Created by Andrey Vensko on 9.06.22.
////
//
import Foundation
import SwiftUI

class PresenterFriendGallety: ObservableObject {

    @Published var imageArray = [String]()

    private var id: String

    private let service = GalleryApiServiceManager()

    init(id: String) {
        self.id = id
        load(id)
    }

    private func sortImage(by sizeType: PhotoSize.SizeType, from array: [PhotoItems]) -> [String] {
        var imageLinks: [String] = []
        for model in array {
            for size in model.sizes {
                if size.type == sizeType {
                    imageLinks.append(size.url)
                }
            }
        }
        return imageLinks
    }

    private func load(_ id: String) {
        service.loadPhoto(idPerson: id) { [weak self] model in
            guard let self = self else { return }
            switch model {
            case .success(let friendPhoto):
                let images = self.sortImage(by: .z, from: friendPhoto)
                DispatchQueue.main.async {
                    self.imageArray = images
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
