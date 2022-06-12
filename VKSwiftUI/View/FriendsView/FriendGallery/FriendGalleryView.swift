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

    private var grid: [GridItem] = [.init(.adaptive(minimum: 100, maximum: 300), spacing: 10),
                                    .init(.adaptive(minimum: 100, maximum: 300), spacing: 10),
                                    .init(.adaptive(minimum: 100, maximum: 300), spacing: 10),
                                    .init(.adaptive(minimum: 100, maximum: 300), spacing: 10)]

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

                    Text(friend.firstName)

                    Spacer()
                }

//                ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: grid, alignment: .center, spacing: 10, pinnedViews: .sectionFooters) {
                        ForEach(loadGallery.imageArray) { text in
                            iiii()
                                .oooo(text)
                        }
                    }
//                }.animation(.easeIn(duration: 10) , value: true  )
            }
        }
    }
}

struct iiii {

    @ObservedObject var load = ImageLoader2()

    @ViewBuilder func oooo(_ text: String) -> some View {
        load.loadImage(url: text)
        return load.image
    }
}

class ImageLoader2: ObservableObject {

    @Published var image: Image = Image(systemName: "pencil.slash")

    private var session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()

    func loadImage(url: String) {
        guard let newUrl = URL(string: url) else { return }

        session.dataTask(with: newUrl, completionHandler: { data, response, error in
            guard let responseData = data, error == nil, let uiImage = UIImage(data: responseData) else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
                self.objectWillChange.send()
            }
        }).resume()
    }
}


extension String: Identifiable {
    public var id: Self {
        self
    }
}


