//
//  NewsView.swift
//  NewsApp With SwiftUI Framework
//
//  Created by Алексей Воронов on 16.06.2019.
//  Copyright © 2019 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct NewsView : View {
    @ObservedObject var viewModel = NewsViewModel()
    
    @State private var viewIndex: Int = 0
    @State private var views: [String] = ["News", "Sources", "Search"]
    
    private var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Views", selection: self.$viewIndex) {
                    ForEach(views, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                if viewIndex == 0 {
                    newsViewList
                        .animation(.spring())
                        .onAppear(perform: {
                            self.viewModel.getTopHeadlines()
                        })
                        .navigationBarTitle(Text("Overview".localized()), displayMode: .large)
                        .navigationBarItems(trailing:
                            Button(
                                action: {
                                    self.viewModel.clearTopHeadlines()
                                    self.viewModel.getTopHeadlines()
                            },
                                label: {
                                    Image(systemName: "arrow.2.circlepath")
                                        .accentColor(Color("BlackColor"))
                                        .imageScale(.large)
                            }
                            )
                    )
                } else if viewIndex == 1 {
                    SourcesListView()
                } else if viewIndex == 2 {
                    SearchForArticlesView()
                }
            }
        }
    }
    
    private var newsViewList: some View {
        List {
            if viewModel.topHeadlines.isEmpty {
                ActivityIndicator()
                    .frame(width: UIScreen.main.bounds.width,
                           height: 50,
                           alignment: .center)
            } else {
                TopHeadlinesView(topHeadlines: viewModel.topHeadlines)
                    .frame(height: UIScreen.main.bounds.width / 4 * 3,
                           alignment: .center)
                    .clipped()
                    .listRowInsets(EdgeInsets())
            }
            
            Section(header: Text(verbatim: "Categories".localized())) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: ArticlesFromCategoryView(category: category)
                            .navigationBarTitle(Text(category.localized().capitalizeFirstLetter()), displayMode: .large)
                    ) {
                        Text(category.localized().capitalizeFirstLetter())
                    }
                }
            }
        }
    }
}
