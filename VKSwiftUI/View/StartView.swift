//
//  StartView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

struct StartView: View {
    @State private var numberScreen: Int = 2
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            TabView(selection: $numberScreen) {
                NavigationView {
                    FriendsView()
                }
                .tabItem({
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                })
                .tag(0)

                NavigationView {
                    GroupsView()
                }
                .tabItem({
                    Image(systemName: "rectangle.3.group")
                    Text("Groups")
                })
                .tag(1)

                NavigationView {
                    NewsView()
                }
                .tabItem({
                    Image(systemName: "newspaper.fill")
                    Text("News")
                })
                .tag(2)
            }
        } else {
            VStack {
                LoginView()
                Button {
                    isLoggedIn = true
                } label: {
                    Text("Start")
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
