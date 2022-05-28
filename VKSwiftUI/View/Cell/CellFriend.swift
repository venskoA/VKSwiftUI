//
//  CellFriends.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

struct CellFriend: View {
    var friend: FriendsModel

    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                Spacer()
                    .frame(width: 1)
                Image(friend.avatar ?? "pencil.slash")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                    .shadow(color: .mint, radius: 10, x: 3, y: 2)

                Spacer()
                    .frame(width: 20)

                VStack(alignment: .leading) {
                    Text("\(friend.firstName) \(friend.secondName)")
                    Text(friend.birthday)
                        .foregroundColor(.gray)
                }

                Spacer(minLength: 10)
            }
        }
    }
}

struct CellFriends_Previews: PreviewProvider {
    static var previews: some View {
        CellFriend(friend: TestCastomFriends().frieds[0])
    }
}
