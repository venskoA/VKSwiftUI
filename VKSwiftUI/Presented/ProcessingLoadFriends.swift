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
}

