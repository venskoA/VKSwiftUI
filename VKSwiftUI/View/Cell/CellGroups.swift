//
//  CellGroups.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 27.05.22.
//

import SwiftUI

struct CellGroups: View {
    var groups: GroupModel

    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                Spacer()
                    .frame(width: 1)
                Image(groups.avatar ?? "pencil.slash")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                    .shadow(color: .mint, radius: 10, x: 3, y: 2)

                Spacer()
                    .frame(width: 20)

                VStack(alignment: .leading) {
                    Text("\(groups.name)")
                }

                Spacer(minLength: 10)
            }
        }
    }
}

struct CellGroups_Previews: PreviewProvider {
    static var previews: some View {
        CellGroups(groups: TestCastomGroups().groups[0])
    }
}
