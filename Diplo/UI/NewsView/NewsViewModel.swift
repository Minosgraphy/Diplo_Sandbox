//
//  NewsViewModel.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI
import Combine

final class NewsViewModel: ObservableObject {
    private let apiProvider = APIProvider<ArticleEndpoint>()
    
    private var cancellable: Cancellable?
    
    @Published private(set) var topHeadlines: Articles = []
    
    deinit {
        cancellable?.cancel()
    }
    
    func clearTopHeadlines() {
        self.topHeadlines = []
    }
    
    func getTopHeadlines() {
        cancellable = apiProvider.getData(from: .getTopHeadlines)
            .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
            .map { $0.articles }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] (articles) in
                self?.topHeadlines = articles
            })
    }
}
