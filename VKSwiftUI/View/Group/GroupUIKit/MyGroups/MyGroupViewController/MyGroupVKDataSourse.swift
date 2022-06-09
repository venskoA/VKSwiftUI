//
//  MyGroupVKDataSourse.swift
//  VKSwiftUI

//  Created by Andrey Vensko on 5.06.22.


import UIKit

extension MyGroupViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourseArrayMyGroup.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: registerTableViewMyGroup,
                                                       for: indexPath) as? MyGroupCell
        else { return UITableViewCell() }

        let group = sourseArrayMyGroup[indexPath.row]

        presenter
            .loadGroupCell(group) { groupCell in
            cell.settings(groupCell)
        }
        
        return cell
    }
}
