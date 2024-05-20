//
//  TypeMetod.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation

enum AllError: Error {
    case parseError
    case requestError(Error)
}

enum TypeMetod: String {
    case friendGet = "/method/friends.get"
    case groupGet = "/method/groups.get"
    case photosGetAll = "/method/photos.getAll"
    case groupsSearch = "/method/groups.search"
    case groupsJoin = "/method/groups.join"
    case groupsLeave = "/method/groups.leave"
    case newsFeed = "/method/newsfeed.get"
}

enum TypeRequests: String {
    case get = "GET"
    case post = "POST"
}
