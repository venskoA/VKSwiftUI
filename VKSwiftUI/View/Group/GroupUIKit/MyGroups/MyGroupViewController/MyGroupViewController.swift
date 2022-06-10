//
//  MyGroupViewController.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 5.06.22.
//

import UIKit
import RealmSwift

class MyGroupViewController: UIViewController {

    var presenter: PresenterMyGroupProtocol

    private var myGroupView: MyGroupView {
        return view as! MyGroupView
    }

    var sourseArrayMyGroup = [GroupItems]() {
        didSet {
            myGroupView.tableView.reloadData()
        }
    }

    override func loadView() {
        super.loadView()
        view = MyGroupView()
    }

    init(presenter: PresenterMyGroupProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)

        presenter.loadGroupForTableView { groups in
            DispatchQueue.main.async {
                self.sourseArrayMyGroup = groups
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let heightTableViev: CGFloat = 70
    let registerTableViewMyGroup = "RegisterTableViewMyGroup"

    override func viewDidLoad() {
        super.viewDidLoad()
        myGroupView.tableView.dataSource = self
        myGroupView.tableView.delegate = self
        myGroupView.tableView.register(MyGroupCell.self, forCellReuseIdentifier: registerTableViewMyGroup)
        createNavigationVC()
    }

    private func createNavigationVC() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAdd))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc
    func tapAdd() {
        presenter.pushAddVC()
    }

// MARK: Remove Notification
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension MyGroupViewController: MyGroupVCProtocol {
    func selfView() -> UIView {
        myGroupView.tableView
    }
}

extension MyGroupViewController {

//    func addGroup() {
//        groupService.loadGroup { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(_):
//                DispatchQueue.main.async {
//                    self.createNotificationGroupToken()
//                    self.tableViewMyGroup.reloadData()
//                }
//            case .failure(let error):
//                print("In main =\(error)")
//            }
//        }
//    }

//    func createNotificationGroupToken() {
//        notificationToken = groupResponse?.observe{ [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .initial(let groupsData):
//                print("Init with \(groupsData.count) groups")
//            case .update(let groups,
//                         deletions: let deletions,
//                         insertions: let insertions,
//                         modifications: let modifications):
//                print("""
//new count \(groups.count)
//deletions \(deletions)
//insertions \(insertions)
//modifications \(modifications)
//""")
//                let deletionsIndexPath = deletions.map { IndexPath(row: $0, section: $0) }
//                let insertionsIndexPath = insertions.map { IndexPath(row: $0, section: $0) }
//                let modificationsIndexPath = modifications.map { IndexPath(row: $0, section: $0) }
//
//                DispatchQueue.main.async {
//                    self.tableViewMyGroup.beginUpdates()
//                    self.tableViewMyGroup.deleteRows(at: deletionsIndexPath, with: .automatic)
//                    self.tableViewMyGroup.insertRows(at: insertionsIndexPath, with: .automatic)
//                    self.tableViewMyGroup.reloadRows(at: modificationsIndexPath, with: .automatic)
//                    self.tableViewMyGroup.endUpdates()
//                }
//            case .error(let error):
//                print("\(error)")
//            }
//        }
//    }
}
