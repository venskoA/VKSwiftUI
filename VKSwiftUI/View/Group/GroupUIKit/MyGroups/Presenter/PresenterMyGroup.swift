//
//  PresentedMyGroup.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 8.06.22.
//

import Foundation
import UIKit

class PresenterMyGroup: PresenterMyGroupProtocol {

    weak var controller: (UIViewController & MyGroupVCProtocol)?

    private var groupService = GroupApiService()
    private var loadImage = ImageLoader()

    func loadGroupForTableView(complition: @escaping ([GroupItems]) -> ()) {
        groupService.loadGroup { result in
            switch result {
            case .success(let data):
                complition(data)
            case .failure(let error):
                print("In main =\(error)")
            }
        }

    }

    func loadGroupCell(_ group: GroupItems, complition: @escaping (GroupCell) -> ()) {
        guard let url = URL(string: group.photo50) else { return }


        loadImage.loadImage(url: url) { loadData in
            switch loadData {
            case .success(let image):
                guard let imageUI = UIImage(data: image) else { return }

                let groupCell = GroupCell(name: group.name, avatar: imageUI)
                
                complition(groupCell)
            case .failure(let error):
                print(error)
            }
        }
    }

    func pushAddVC() {

        guard let view = controller?.selfView() else { return }

        let presenter = PresenterSearchGroup()
        let vc = SearchGroupsViewController(preseter: presenter)
        presenter.controller = vc


        let loading = UIActivityIndicatorView(style: .large)
        loading.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2 + 10)
        loading.transform = CGAffineTransform(scaleX: 2, y: 2)
        view.addSubview(loading)
        loading.startAnimating()

        // MARK: Time delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.controller?.navigationController?.pushViewController(vc, animated: true)

            loading.removeFromSuperview()
            view.backgroundColor = UIColor.white.withAlphaComponent(0)
        })
    }

    func presentedLeaveGroup(_ id: Int, complition: @escaping ([GroupItems]) -> ()) {
        let allertController = UIAlertController(title: "Delet cell",
                                                 message: "What are you sure to delet?",
                                                 preferredStyle: .alert)
        let astionYes = UIAlertAction(title: "yes",
                                      style: .default,
                                      handler: { [weak self] _ in
            guard let self = self else { return }

            self.groupService.deleteGroup(idGroup: id) { result in
                switch result {
                case .success(let group):
                    if group.response == 1 {
                        self.loadGroupForTableView { groups in
                            complition(groups)
                        }
                    }
                case .failure(let error):
                    print("Error delete in delegate\(error)")
                }
            }
        })
        let actionNo = UIAlertAction(title: "no", style: .cancel, handler: nil)

        allertController.addAction(astionYes)
        allertController.addAction(actionNo)
        controller?.present(allertController, animated: true, completion: nil)
    }
}
