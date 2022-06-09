//
//  MyGroupVKDelegate.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 5.06.22.

import UIKit

extension MyGroupViewController: UITableViewDelegate {

// MARK: Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightTableViev
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
// MARK: Add alert for remove group

        if editingStyle == .delete {
            let id = sourseArrayMyGroup[indexPath.row].id
            presenter
                .presentedLeaveGroup(id) { groups in
                DispatchQueue.main.async {
                    self.sourseArrayMyGroup = groups
                }
            }
        }
    }
}
