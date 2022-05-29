//
//  GroupsView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import SwiftUI

struct GroupsView: View {
    
    let testGroups = TestCastomGroups().groups
    
    var body: some View {
        VStack{
            List(testGroups) { group in
                NavigationLink {
                    
                } label: {
                    CellGroups(groups: group)
                }
                .navigationTitle("Groups")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
