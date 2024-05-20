//
//  GridCellFriendsGallery.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 15.06.22.
//

import SwiftUI

struct GridCellFriendsGallery: View {

    @ObservedObject var load: LoadImageForGallery
    @Binding var bool: Bool

    var body: some View {
        load.image
            .resizable()
            .aspectRatio(1, contentMode: .fill)
//            .padding(20)
//            .frame(width: 100, height: 100, alignment: .center)
            .onAppear {
                bool.toggle()
            }
    }
}
