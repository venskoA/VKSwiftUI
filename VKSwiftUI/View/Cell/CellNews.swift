//
//  CellNews.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import SwiftUI

struct CellNews: View {
    var news: Cell

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.orange)
                .background(.orange)
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Image(news.avatar)
                        .modifier(ImageRadiusModifare())
                    Spacer()
                        .frame(width: 20)

                    HStack {
                        Text(news.nameGroup)
                        Text(news.manualNews ?? " ")
                            .lineLimit(3)
                    }
                }

                if news.photoAttachments != nil {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach(news.photoAttachments!) { foto in
                                    Image(foto)
                                }
                            }
                            .padding()
                        }
                    }
                }

                HStack {
                    likeButton
                    messageButton
                    sharedButton
                    browsingButton
                }
            }
        }
    }
}

extension CellNews {
    var likeButton: some View {
        ButtonInNewBuilder {
            Button {
                print("heart")
            } label: {
                HStack {
                    Image(systemName: "heart")
                    Text("\(news.likes ?? 0)")
                }
            }
        }
    }

    var messageButton: some View {
        ButtonInNewBuilder {
            Button {
                print("message")
            } label: {
                HStack {
                    Image(systemName: "message")
                    Text("\(news.comments ?? 0)")
                }
            }
        }
    }

    var sharedButton: some View {
        ButtonInNewBuilder {
            Button {
                print("arrowshape.turn.up.right")
            } label: {
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("\(news.reply ?? 0)")
                }
            }
        }
    }

    var browsingButton: some View {
        ButtonInNewBuilder {
            Button {
                print("eye")
            } label: {
                HStack {
                    Image(systemName: "eye")
                    Text("\(news.browsing ?? 0)")
                }
            }
        }
    }
}

struct CellNews_Previews: PreviewProvider {
    static var previews: some View {
        CellNews(news: TestCastomNews().newsCell[0])
    }
}
