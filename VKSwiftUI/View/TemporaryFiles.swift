//
//  TemporaryFiles.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import Foundation

struct TestCastomFriends {
    var frieds: [FriendsModel] = [FriendsModel(id: UUID(), firstName: "Andre", secondName: "Vensko", birthday: "15.01.1995", avatar: "111", fotoArray: ["26", "25", "23", "21", "20"]), FriendsModel(id: UUID(), firstName: "Kristina", secondName: "hrinkevich", birthday: "15.01.1995", avatar: "doc.text.fill", fotoArray: ["20", "21", "22", "23", "24"])]
}

struct TestCastomGroups {
    var groups: [GroupModel] = [GroupModel(id: UUID(), name: "Strudents Drink Alcohol", avatar: "12"),
                                GroupModel(id: UUID(), name: "Strudents Drink Alcohol", avatar: "13")]
}
