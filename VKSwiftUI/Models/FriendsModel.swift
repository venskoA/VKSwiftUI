//
//  FriendsModel.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import Foundation

import RealmSwift
import UIKit
import SwiftUI

struct FriendsVK: Codable {
    let response: ResponseFriends
}

struct ResponseFriends: Codable {
    let count: Int
    let items: [FriendItems]
}

class FriendItems: Object, Codable, Identifiable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo200orig: String = ""

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo200orig = "photo_200_orig"
    }

    override class func primaryKey() -> String? {
        return "id"
    }
}

struct FriendsModel: Identifiable {
    var id: UUID = UUID()

    var myId: Int = 0
    var firstName: String = " "
    var secondName: String = " "
    var birthday: String = " "
    var avatar: UIImage = UIImage(systemName: "pencil.slash")!
    var fotoArray: [String]?
}
