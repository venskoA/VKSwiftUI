//
//  FriendsView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

struct FriendsView: View {

    let testFriend = TestCastomFriends().frieds

    var body: some View {
        NavigationView {
            ZStack{
                List(testFriend) { friend in
                    NavigationLink {
                        FriendGalleryView(friend: friend)
                    } label: {
                        CellFriend(friend: friend)
                    }
                    .navigationTitle("Friends")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }

    func printuu() -> some View {
        print("Destination 11")
        return Text("bjkbk")
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}


