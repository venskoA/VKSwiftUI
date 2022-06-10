//
//  ButtonNewModifare.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 5.06.22.
//

import Foundation
import SwiftUI

struct ButtonNewModifare: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .padding(5)
            .background(.blue)
            .cornerRadius(30)
            .lineLimit(1)
            .buttonStyle(.borderedProminent)
    }
}
