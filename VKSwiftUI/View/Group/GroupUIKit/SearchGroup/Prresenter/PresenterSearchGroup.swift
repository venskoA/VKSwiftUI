//
//  PresenterSearchGroup.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 9.06.22.
//

import Foundation
import UIKit

class PresenterSearchGroup: PresenterSearchProtocol {

    weak var controller: (UIViewController & SearchVCProtocol)?

    private let loadImage = ImageLoader()
    var groupService = GroupApiService()
    let groupServiseManager = GroupServiceManager()
    let realm = RealmCacheService()
    let operationQueue = OperationQueue()
    
    func searchGroupForTableView(searchText: String, complition: @escaping ([GroupItems]) -> ()) {
        let processData = ProcessingData(text: searchText)
        processData.completionBlock = {
            complition(processData.dataAll)
        }
        operationQueue.addOperation(processData)
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

    func allertAddNewGroup(_ id: Int) {
        let alertController = UIAlertController(title: "Add Group", message: nil, preferredStyle: .actionSheet)
        let alertYes = UIAlertAction(title: "yes", style: .default, handler: {[weak self] _ in
            guard let self = self else{return}

            self.groupService.addGroup(idGroup: id) { result in

            }
        })

        let alertNo = UIAlertAction(title: "no", style: .cancel, handler: nil)

        alertController.addAction(alertYes)
        alertController.addAction(alertNo)

        controller?.present(alertController, animated: true, completion: nil)
    }
}
