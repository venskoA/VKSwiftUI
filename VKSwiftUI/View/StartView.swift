//
//  StartView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

struct StartView: View {
    @State private var numberScreen: Int = 0

    var body: some View {
        TabView(selection: $numberScreen) {
            FriendsView()
                .tabItem({
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                })
                .tag(0)

            Text("Groups")
                .tabItem({
                    Image(systemName: "rectangle.3.group")
                    Text("Groups")
                })
                .tag(1)

            Text("News")
                .tabItem({
                    Image(systemName: "newspaper.fill")
                    Text("News")
                })
                .tag(2)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
