//
//  FriendGallery.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import SwiftUI

struct FriendGalleryView: View {
    var friend: FriendsModel

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.teal)
            VStack {
                HStack {
                    Spacer()
                        .frame(width: 25)
                    Image(friend.avatar ?? "pencil.slash")
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

struct FriendGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        FriendGalleryView(friend: TestCastomFriends().frieds[0])
    }
}

extension String: Identifiable {
    public var id: Self {
        self
    }
}
