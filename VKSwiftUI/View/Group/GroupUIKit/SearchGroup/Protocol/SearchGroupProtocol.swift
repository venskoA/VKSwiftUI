//
//  SearchGroupProtocol.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 9.06.22.
//

import Foundation

protocol SearchVCProtocol {
    func reloadTableView()
}

protocol PresenterSearchProtocol {
    func searchGroupForTableView(searchText: String, complition: @escaping ([GroupItems]) -> ())
    func loadGroupCell(_ group: GroupItems, complition: @escaping (GroupCell) -> ())
    func allertAddNewGroup(_ id: Int)
}
