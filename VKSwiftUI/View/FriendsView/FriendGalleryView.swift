//
//  FriendGallery.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import SwiftUI

struct FriendGalleryView: View {
    var friend: FriendsModel
//    @ObservedObject var loadGallery: ProcessingLoadGallery = .init()

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.teal)
                .background(.teal)
            VStack {
                HStack {
                    Spacer()
                        .frame(width: 25)
                    Image(uiImage: friend.avatar ?? UIImage())
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(50, antialiased: true)

                    Spacer()
                        .frame(width: 20)

                    Text(friend.firstName)

                    Spacer()
                }

                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(friend.fotoArray ?? ["pencil.slash"]) { foto in
                            Image(foto)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

//struct FriendGalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendGalleryView(friend: TestCastomFriends().frieds[0])
//    }
//}

extension String: Identifiable {
    public var id: Self {
        self
    }
}

//class ProcessingLoadGallery: ObservableObject {
//    var service = GalleryApiServiceManager()
//    var friendsService = FriendsServiceManager()
//
//    func loadDataInView() {
//        let name = allSourseArray["name"]
//        guard let avatarUrl = allSourseArray["avatarUrl"] else { return }
//        friendsService.loadImage(url: avatarUrl) {[weak self] photo in
//            guard let self = self else { return }
//            self.avatarImage.image = photo
//        }
//        nameLabel.text = name
//        idPerson = allSourseArray["id"] ?? ""
//    }
//
//    func sortImage(by sizeType: PhotoSize.SizeType, from array: [PhotoItems]) -> [String] {
//        var imageLinks: [String] = []
//        for model in array {
//            for size in model.sizes {
//                if size.type == sizeType {
//                    imageLinks.append(size.url)
//                }
//            }
//        }
//        return imageLinks
//    }
//
//    func addPhotos() {
//        service.loadPhoto(idPerson: idPerson) { [weak self] model in
//            guard let self = self else { return }
//            switch model {
//            case .success(let friendPhoto):
//                let images = self.sortImage(by: .z, from: friendPhoto)
//                self.sourseArray = images
//                DispatchQueue.main.async {
//                    self.galleryCollectionView.reloadData()
//                }
//            case .failure(let error):
//                print("----- \(error)")
//            }
//        }
//    }
//
//    func transformArray(arr: [String]) {
//        for index in arr {
//            print(index)
//            friendsService.loadImage(url: index) { image in
//                self.sourseArrayImage.append(image)
//            }
//        }
//        print(sourseArrayImage)
//    }
//}
