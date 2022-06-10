//
//  GroupsModel.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import Foundation

struct GroupModel: Identifiable {
    var id: UUID = UUID()

    var name: String
    var avatar: String?
}
