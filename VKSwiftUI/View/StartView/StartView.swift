//
//  StartView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

struct StartView: View {
    @State private var numberScreen: Int = 1
    @State private var isLoggedIn = false
    @State var loadWebController: Bool = false

    var body: some View {
        if loadWebController {
            TabView(selection: $numberScreen) {
                NavigationView {
                    FriendsView()
                }
                .tabItem({
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                })
                .tag(0)
                
                GroupsView()
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
                LoginView(load: $loadWebController)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
