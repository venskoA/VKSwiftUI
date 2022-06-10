//
//  MyGroupProtocolPresented.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 8.06.22.
//

import Foundation
import UIKit

protocol MyGroupVCProtocol {
    func selfView() -> UIView 
}

protocol PresenterMyGroupProtocol {
    func loadGroupForTableView(complition: @escaping ([GroupItems]) -> ())
    func loadGroupCell(_ group: GroupItems, complition: @escaping (GroupCell) -> ())
    func pushAddVC()
    func presentedLeaveGroup(_ id: Int, complition: @escaping ([GroupItems]) -> ())
}
