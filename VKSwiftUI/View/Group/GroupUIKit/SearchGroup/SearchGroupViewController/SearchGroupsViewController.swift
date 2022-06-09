import UIKit
//import FirebaseDatabase

class SearchGroupsViewController: UIViewController {

    var presenter: PresenterSearchProtocol

    var searchGroupsView: SearchGroupView {
        return view as! SearchGroupView
    }

    override func loadView() {
        super.loadView()
        view = SearchGroupView()
    }

    var sourseArrayAllGroup = [GroupItems]() {
        didSet {
            searchGroupsView.tableView.reloadData()
        }
    }

    init(preseter: PresenterSearchProtocol) {
        self.presenter = preseter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let registerTableViewAllGroup = "RegisterTableViewAllGroup"
    let heightTableViev: CGFloat = 65

    override func viewDidLoad() {
        super.viewDidLoad()
        searchGroupsView.tableView.dataSource = self
        searchGroupsView.tableView.delegate = self
// MARK: Register castom tableView
        searchGroupsView.tableView.register(MyGroupCell.self, forCellReuseIdentifier: registerTableViewAllGroup)
        searchGroupsView.searchView.delegate = self
    }
}

extension SearchGroupsViewController: SearchVCProtocol {
    func reloadTableView() {
        searchGroupsView.tableView.reloadData()
    }
}
