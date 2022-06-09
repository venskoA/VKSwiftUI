import UIKit
import AVFoundation

extension SearchGroupsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.searchGroupForTableView(searchText: searchText) { [weak self] groups in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.sourseArrayAllGroup = groups
            }
        }
    }
}

