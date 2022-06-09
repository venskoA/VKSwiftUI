//
//  TableViewCell.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 8.06.22.
//

import Foundation
import UIKit

class MyGroupCell: UITableViewCell {

    private(set) var avatarGroupImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.image = UIImage(systemName: "pencil.slash")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private(set) var avatarGroupView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.backgroundColor = .castomColorVK
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private(set) var nameGroupLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func settings(_ group: GroupCell) {
        avatarGroupImage.image = group.avatar
        nameGroupLabel.text = group.name
    }

    private func createUI() {
        createAvaterView()
        createAvaterImage()
        createName()
    }

    private func createAvaterView() {
        self.addSubview(avatarGroupView)

        NSLayoutConstraint.activate([
            avatarGroupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarGroupView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            avatarGroupView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -10),
            avatarGroupView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10),
        ])
    }

    private func createAvaterImage() {
        avatarGroupView.addSubview(avatarGroupImage)

        NSLayoutConstraint.activate([
            avatarGroupImage.leadingAnchor.constraint(equalTo: avatarGroupView.leadingAnchor),
            avatarGroupImage.trailingAnchor.constraint(equalTo: avatarGroupView.trailingAnchor),
            avatarGroupImage.topAnchor.constraint(equalTo: avatarGroupView.topAnchor),
            avatarGroupImage.bottomAnchor.constraint(equalTo: avatarGroupView.bottomAnchor),
        ])
    }

    private func createName() {
        self.addSubview(nameGroupLabel)

        NSLayoutConstraint.activate([
            nameGroupLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameGroupLabel.leadingAnchor.constraint(equalTo: avatarGroupImage.trailingAnchor, constant: 20),
            nameGroupLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        ])
    }
}
