//
//  ButtonInNewBuilder.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import Foundation
import SwiftUI

struct ButtonInNewBuilder: View {
    var content: Button<HStack<TupleView<(Image, Text)>>>

    init(@ViewBuilder content: () -> Button<HStack<TupleView<(Image, Text)>>>) {
        self.content = content()
    }

    var body: some View {
        content
            .font(.system(size: 12))
            .padding(5)
            .background(.blue)
            .cornerRadius(30)
            .lineLimit(1)
            .buttonStyle(.borderedProminent)
    }
}
