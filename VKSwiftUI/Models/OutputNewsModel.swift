//
//  OutputNewsModel.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation
import UIKit

struct OutputNewsModel: Identifiable {
    var id: UUID = UUID()
    var cells: [Cell]
}

struct Cell: Identifiable {
    var id: UUID = UUID()

    var postId: Int
    var avatar: String
    var date: String
    var nameGroup: String
//        var date: String
    var manualNews: String?
    var likes: Int?
    var comments: Int?
    var reply: Int?
    var browsing: Int?
    var photoAttachments: [String]?

    var avatarImage: UIImage?
    var photoAttachmentsImage: [UIImage]?
}

struct FotoCellAttachment {
    var url: String?
}
