//
//  SearchView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 9.06.22.
//

import Foundation
import UIKit

class SearchGroupView: UIView {
    var searchView = UISearchBar()
    var tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSearchView()
        createTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: ???
    private func createSearchView() {
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.barStyle = .black
        searchView.showsCancelButton = true

        self.addSubview(searchView)

        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: self.topAnchor, constant: 35),
            searchView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    private func createTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.separatorInset = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 0.0, right: 10.0)
        tableView.isHidden = false
        self.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

