//
//  FriendsSericeManager.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation
import UIKit

final class FriendsServiceManager {
    private var service = FriendsApiService()
    private var imageServise = ImageLoader()

    func loadFriends(completion: @escaping([FriendItems]) -> Void) {
        service.loadFriends { result in
            switch result {
            case .success(let friend):
                let section = friend.response.items
                completion(section)
            case .failure(_):
                return
            }
        }
    }

    func loadImage(url: String, comletion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: url) else { return }
        imageServise.loadImage(url: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                comletion(image)
            case .failure(let error):
                debugPrint("Error \(error.localizedDescription)")
            }
        }
    }
}

