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
                    .modifier(ImageRadiusModifare())

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
