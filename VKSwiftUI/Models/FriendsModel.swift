//
//  FriendsModel.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import Foundation

struct FriendsModel: Identifiable {
    var id: UUID = UUID()

    var firstName: String
    var secondName: String
    var birthday: String
    var avatar: String?
    var fotoArray: [String]?
}
