//
//  FriendGallery.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import SwiftUI
import RealmSwift

struct FriendGalleryView: View {
    var friend: FriendItems

    @ObservedObject var loadGallery: PresenterFriendGallety

    @ObservedObject var load: ProcessingLoadCellFriend

    @State var bool = false

    private var grid: [GridItem] = [.init(.fixed(70), spacing: 10, alignment: .center),
                                    .init(.flexible(minimum: 50, maximum: 60), spacing: 10, alignment: .center),
                                    .init(.adaptive(minimum: 25, maximum: 40), spacing: 10, alignment: .center)]

    init(friend: FriendItems) {
        self.friend = friend
        let loadCell = ProcessingLoadCellFriend(friend)
        self.load = loadCell
        self.loadGallery = .init(id: String(friend.id))
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.teal)
                .background(.teal)
            VStack {
                HStack {
                    Spacer()
                        .frame(width: 25)
                    Image(uiImage: load.friendModel.avatar)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(50, antialiased: true)

                    Spacer()
                        .frame(width: 20)

                    Text("\(friend.firstName) \(friend.lastName)")

                    Spacer()
                }

                // MARK: Grid
                    gridCastom
            }.animation(.easeIn(duration: 10) , value: true  )
        }
    }
}

extension FriendGalleryView {
    var gridCastom: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: grid, alignment: .center, spacing: 10, pinnedViews: .sectionHeaders) {
                    ForEach(loadGallery.imageArray) { text in
                        if friend.id % 2 == 0 {
                            AsyncImage(url: URL(string: text) ) { image in
                                image
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            GridCellFriendsGallery(load: LoadImageForGallery(text), bool: $bool)
                        }
                    }
                }
            }

            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: grid, alignment: .center, spacing: 10, pinnedViews: .sectionHeaders) {
                    ForEach(loadGallery.imageArray) { text in
                        if friend.id % 2 == 0 {
                            AsyncImage(url: URL(string: text) ) { image in
                                image
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            GridCellFriendsGallery(load: LoadImageForGallery(text), bool: $bool)
                        }
                    }
                }
            }
        }
    }
}

extension String: Identifiable {
    public var id: Self {
        self
    }
}
