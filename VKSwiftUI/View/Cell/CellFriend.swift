//
//  CellFriends.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

struct CellFriend: View {

    var friend: FriendItems

    @ObservedObject var load: ProcessingLoadCellFriend

    init(_ friend: FriendItems) {
        self.friend = friend
        load = .init(friend)
    }
    
    let friendsService = FriendsServiceManager()

    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                Spacer()
                    .frame(width: 1)
                Image(uiImage: load.friendModel.avatar)
                    .resizable()
                    .modifier(ImageRadiusModifare())
                
                Spacer()
                    .frame(width: 20)
                
                VStack(alignment: .leading) {
                    Text("\(load.friendModel.firstName) \(load.friendModel.secondName)")
//                    Text(friend.birthday)
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 10)
            }
        }
    }
}

//struct CellFriends_Previews: PreviewProvider {
//    static var previews: some View {
//        CellFriend(friend: TestCastomFriends().frieds[0])
//    }
//}

