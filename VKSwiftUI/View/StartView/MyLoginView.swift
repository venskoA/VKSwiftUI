//
//  Login.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import Foundation
import SwiftUI
import CoreData
import Combine

struct MyLoginView: View {
    private let loginDef = ""
    private let passwordDef = ""

    let randonNumbers = Int.random(in: 0...100)

    @State private var login: String = ""
    @State private var password: String = ""
    @State private var shouldShowLogo: Bool = true
    @State private var showStartView: Bool = false

    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map { _ in false }
    ).removeDuplicates()

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("111")
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width, maxHeight: 1000)
            }

            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        Spacer(minLength: 150)

                        Text("VK")
                            .foregroundColor(.blue)
                            .font(.system(size: 60))
                            .font(.system(.largeTitle))
                            .padding(.top, 10)

                        Spacer(minLength: 180)

                        VStack {
                            HStack {
                                Text("Login:")
                                    .foregroundColor(.white)
                                Spacer()
                                TextField("", text: $login)
                                    .frame(maxWidth: 230)
                                    .background(.gray)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            Spacer(minLength: 50)
                            HStack {
                                Text("Password:")
                                    .foregroundColor(.white)
                                Spacer()
                                SecureField("", text: $password)
                                    .frame(maxWidth: 230)
                                    .background(.gray)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .id("password")
                            }
                        }
                        .frame(maxWidth: 350)

                        Spacer(minLength: 50)

                        Button {
                            if login == loginDef && password == passwordDef {
                                showStartView = true
                            }
                        } label: {
                            Text("Ok")
                                .colorMultiply(.black)
                        }
                        .padding()
                        .background(.blue)
                    }
                }
            }

            Spacer(minLength: 20)

        }
        .sheet(isPresented: $showStartView) {
            StartView()
        }

//        .onTapGesture {
//            UIApplication.shared.endEditing()
//        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from:
                    nil, for: nil)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MyLoginView()
                .previewDevice("iPhone 13")
        }
    }
}

@resultBuilder
struct MyFirstBuilder {
    static func buildBlock(_ components: Int...) -> [Int] {
        components.map { element in
            element * 2
        }
    }
}

extension Int {
    init(@MyFirstBuilder content: () -> Int) {
        self.init(content())
    }
}
