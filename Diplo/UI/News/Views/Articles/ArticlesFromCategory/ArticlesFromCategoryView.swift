//
//  ArticlesFromCategoryView.swift
//  Diplo
//
//  Created by Björn Waltert on 01.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct ArticlesFromCategoryView : View {
    @ObservedObject var viewModel = ArticlesFromCategoryViewModel()
    
    var category: String = ""
    
    var body: some View {
        VStack {
            if viewModel.articles.isEmpty {
                ZStack {
                    MainBackground()
                    ActivityIndicator()
                        .frame(width: UIScreen.main.bounds.width,
                               height: 50,
                               alignment: .center)
                }
            } else {
                ArticlesList(articles: viewModel.articles)
            }
        }
        .onAppear {
            self.viewModel.getArticles(from: self.category)
        }
    }
}
