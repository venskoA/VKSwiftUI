//
//  ProcessingLoadFriends.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 29.05.22.
//

import Foundation
import SwiftUI

class ProcessingLoadFrieds: ObservableObject {

    var friendsArray = [FriendItems]()

    let friendsService = FriendsServiceManager()

    init() {
        featchFriends()
    }

    func featchFriends() {
        friendsService.loadFriends { friends in
            DispatchQueue.main.async {
                self.friendsArray = friends
                self.objectWillChange.send()
            }
        }
    }

    func simpleFactory(_ inputData: FriendItems, complition: @escaping (FriendsModel) -> ()) {
        friendsService.loadImage(url: inputData.photo200orig) { image in
            let id = inputData.id
            let avatar = image
            let firstName = inputData.firstName
            let secondName = inputData.lastName
            let friend = FriendsModel(id: UUID(), myId: id, firstName: firstName, secondName: secondName, birthday: " ", avatar: avatar, fotoArray: [" "])
            complition(friend)
        }
    }
}

