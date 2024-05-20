//
//  ImageRadiusModifare.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation
import SwiftUI

struct ImageRadiusModifare: ViewModifier {
    private let heigth: CGFloat = 50

    func body(content: Content) -> some View {
        content
            .frame(width: heigth, height: heigth)
            .cornerRadius(heigth / 2)
            .shadow(color: .mint, radius: 10, x: 3, y: 2)
    }
}
