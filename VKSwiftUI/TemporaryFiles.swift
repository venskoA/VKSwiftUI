//
//  TemporaryFiles.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import Foundation
import UIKit


struct TestCastomNews {
    var news = OutputNewsModel(cells: [Cell(postId: 3758973953989348, avatar: "13", date: "Date", nameGroup: "Strudents Drink Alcohol", manualNews: "", likes: 13, tabLikes: true, comments: 12, reply: 15, browsing: 66, photoAttachments: ["25", "26"], avatarImage: UIImage(contentsOfFile: "25"), photoAttachmentsImage: [UIImage(imageLiteralResourceName: "25"), UIImage(imageLiteralResourceName: "26")]),
                                       Cell(postId: 3758973953989348, avatar: "13", date: "Date", nameGroup: "Strudents Drink TWO Alcohol", manualNews: "", likes: 13, tabLikes: false, comments: 12, reply: 15, browsing: 66, photoAttachments: ["25", "26"], avatarImage: UIImage(contentsOfFile: "20"), photoAttachmentsImage: [UIImage(imageLiteralResourceName: "21"), UIImage(imageLiteralResourceName: "22")])])

    var newsCell = [Cell(postId: 3758973953989348, avatar: "13", date: "Date", nameGroup: "Strudents Drink Alcohol", manualNews: "", likes: 13, tabLikes: true, comments: 12, reply: 15, browsing: 66, photoAttachments: ["25", "26"], avatarImage: UIImage(contentsOfFile: "25"), photoAttachmentsImage: [UIImage(imageLiteralResourceName: "25"), UIImage(imageLiteralResourceName: "26")]),
                    Cell(postId: 3758973953989348, avatar: "13", date: "Date", nameGroup: "Strudents Drink TWO Alcohol", manualNews: "", likes: 13, tabLikes: false, comments: 12, reply: 15, browsing: 66, avatarImage: UIImage(contentsOfFile: "20"))]
}

//Cell(postId: 3758973953989348, avatar: "13", date: "Date", nameGroup: "Strudents Drink TWO Alcohol", manualNews: "", likes: 13, comments: 12, reply: 15, browsing: 66, photoAttachments: ["25", "26"], avatarImage: UIImage(contentsOfFile: "20"), photoAttachmentsImage: [UIImage(imageLiteralResourceName: "21"), UIImage(imageLiteralResourceName: "22")])
