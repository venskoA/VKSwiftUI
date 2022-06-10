//
//  ProcessingLoadCellFriend.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 29.05.22.
//

import Foundation

class ProcessingLoadCellFriend: ObservableObject {

    let friendsService = FriendsServiceManager()

    @Published var friendModel = FriendsModel()

    init(_ friend: FriendItems) {
        simpleFactory(friend)
    }

    func simpleFactory(_ inputData: FriendItems) {
        friendsService.loadImage(url: inputData.photo200orig) {[weak self] image in
            guard let self = self else { return }
            let id = inputData.id
            let avatar = image
            let firstName = inputData.firstName
            let secondName = inputData.lastName
            let friendWithImage = FriendsModel(id: UUID(), myId: id, firstName: firstName, secondName: secondName, birthday: " ", avatar: avatar, fotoArray: [" "])
            DispatchQueue.main.async {
                self.friendModel = friendWithImage
            }
        }
    }
}
