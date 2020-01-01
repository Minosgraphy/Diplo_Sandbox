//
//  ArticlesList.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct ArticlesList : View {
    @State var shouldPresent: Bool = false
    @State var articleURL: URL?
    @State var isActive: Bool = false
    
    var articles: [Article]
    
    var body: some View {
        ZStack {
            MainBackgroundColor()
            ScrollView {
                VStack(alignment: .center) {
                    ForEach(articles, id: \.self) { article in
                        Button(
                            action: {
                                self.articleURL = article.url
                                self.shouldPresent = true
                        },
                            label: {
                                ArticleRow(article: article)
                                    .animation(.spring())
                        }
                        )
                    }
                }
            }
            .sheet(isPresented: $shouldPresent) {
                SafariView(url: self.articleURL!)
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}
