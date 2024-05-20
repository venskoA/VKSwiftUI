//
//  PhotoUser.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation

struct PhotoUserModel: Codable {
    let response: ResponsePhoto
}

struct ResponsePhoto: Codable {
    let count: Int
    let items: [PhotoItems]
}

struct PhotoItems: Codable {
    let sizes: [PhotoSize]

    enum CodingKeys: String, CodingKey {
        case sizes
    }
}

struct PhotoSize: Codable {
    let url: String
    let type: SizeType

    enum SizeType: String, Codable {
        case m = "m"
        case o = "o"
        case p = "p"
        case q = "q"
        case r = "r"
        case s = "s"
        case w = "w"
        case x = "x"
        case y = "y"
        case z = "z"
    }
}
