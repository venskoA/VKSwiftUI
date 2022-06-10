
import UIKit

// MARK: Extension for AllGRoup
extension SearchGroupsViewController: UITableViewDataSource{

// MARK: Weight table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

// MARK: Nambers line
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourseArrayAllGroup.count
    }

// MARK: Add in tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: registerTableViewAllGroup, for: indexPath) as? MyGroupCell else {return UITableViewCell()}

        let group = sourseArrayAllGroup[indexPath.row]

        presenter
            .loadGroupCell(group) { groupCell in
            cell.settings(groupCell)
        }

        return cell
    }
}
