//
//  ArticlesFromCategoryViewModel.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI
import Combine

final class ArticlesFromCategoryViewModel: ObservableObject {
    private let apiProvider = APIProvider<ArticleEndpoint>()
    
    private var cancellable: Cancellable?
    
    @Published private(set) var articles: Articles = []
    
    deinit {
        cancellable?.cancel()
    }
    
    func getArticles(from category: String) {
        cancellable = apiProvider.getData(from: ArticleEndpoint.getArticlesFromCategory(category))
            .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
            .map { $0.articles }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] (articles) in
                self?.articles = articles
            })
    }
}
