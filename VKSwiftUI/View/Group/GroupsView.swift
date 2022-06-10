//
//  GroupsView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import SwiftUI
import UIKit

struct MyGroups: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController

    func makeUIViewController(context: Context) -> UINavigationController {
        let presenter = PresenterMyGroup()
        let vcMyGroup = MyGroupViewController(presenter: presenter)
        presenter.controller = vcMyGroup

        let vc = UINavigationController(rootViewController: vcMyGroup)
        return vc
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {

    }
}

struct GroupsView: View {
    var body: some View {
        ZStack{
            MyGroups()
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
