//
//  NewsView.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 28.05.22.
//

import SwiftUI

struct NewsView: View {
    let testNews = TestCastomNews().newsCell
    
    var body: some View {
        ZStack{
            List(testNews) { news in                    
                CellNews(news: news)
                    .navigationTitle("News")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
