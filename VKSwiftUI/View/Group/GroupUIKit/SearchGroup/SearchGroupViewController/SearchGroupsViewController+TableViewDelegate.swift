import UIKit

extension SearchGroupsViewController: UITableViewDelegate {

// MARK: Height table
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightTableViev
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

// MARK: Create allert for add Group
        
        let idGroup = sourseArrayAllGroup[indexPath.row].id

        presenter
            .allertAddNewGroup(idGroup)
    }
}
