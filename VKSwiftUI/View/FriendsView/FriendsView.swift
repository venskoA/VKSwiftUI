//
//  FriendsView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

struct FriendsView: View {
        
    @ObservedObject var loadFriend: ProcessingLoadFrieds = .init()
    
    var body: some View {
        ZStack{
            List(loadFriend.friendsArray) { friend in
                NavigationLink {
//                    FriendGalleryView(friend: <#T##FriendsModel#>)
                } label: {
                    CellFriend(friend)
                }
                .navigationTitle("Friends")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}



