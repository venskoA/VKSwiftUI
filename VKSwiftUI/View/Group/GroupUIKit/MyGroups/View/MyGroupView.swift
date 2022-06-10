//
//  MyGroupView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 8.06.22.
//

import Foundation
import UIKit

class MyGroupView: UIView {
    var tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        createTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.separatorInset = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 0.0, right: 10.0)
        tableView.isHidden = false
        self.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
