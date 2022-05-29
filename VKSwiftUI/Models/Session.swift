//
//  Session.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation

class Session {
    static let shared = Session()

    var token: String?
    var userId: Int?

    private init() {}
}
