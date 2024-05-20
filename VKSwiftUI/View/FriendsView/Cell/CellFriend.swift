//
//  CellFriends.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

struct TranslationAvatar {
    var standart: CGFloat = 0
    var openX: CGFloat = 100
    var openY: CGFloat = 20
}

struct CellFriend: View {

    @State private var animation = false

    @ObservedObject var load: ProcessingLoadCellFriend
    private var friend: FriendItems
    private var transf = TranslationAvatar()

    init(_ friend: FriendItems) {
        self.friend = friend
        load = .init(friend)
    }

    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                Spacer()
                    .frame(width: 1)
                Image(uiImage: load.friendModel.avatar)
                    .resizable()
                    .modifier(ImageRadiusModifare())
                    .scaleEffect(animation ? 5 : 1)
                    .animation(.spring()
                                .repeatCount(5, autoreverses: true),
                               value: animation)
                    .transformEffect(.init(translationX: animation ? transf.openX : transf.standart,
                                           y: animation ? transf.openY : transf.standart))
                    .onTapGesture {
                        animation.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withTransaction(.init(animation: Animation.easeOut)) {
                                animation.toggle()
                            }
                        }
                    }
                
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
