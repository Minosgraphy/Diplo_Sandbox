//
//  NewsView.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct NewsView : View {
    @ObservedObject var viewModel = NewsViewModel()
    
    private var categories: [String] = ["business", "entertainment", "general", "health", "science", "technology"]
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView(content: {
            newsViewList
                .animation(.spring())
                .onAppear(perform: {
                    self.viewModel.getTopHeadlines()
                })
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
//                .navigationBarItems(trailing:
//                    Button(
//                        action: {
//                            self.viewModel.clearTopHeadlines()
//                            self.viewModel.getTopHeadlines()
//                    },
//                        label: {
//                            Image(systemName: "arrow.2.circlepath")
//                                .accentColor(Color("BlackColor"))
//                                .imageScale(.large)
//                    }
//                    )
//            )
        })
    }
    
    private var newsViewList: some View {
        List {
            if viewModel.topHeadlines.isEmpty {
                ActivityIndicator()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.width / 4 * 3,
                           alignment: .center)
            } else {
                TopHeadlinesView(topHeadlines: viewModel.topHeadlines)
                    .frame(height: UIScreen.main.bounds.width / 4 * 3,
                           alignment: .center)
                    .clipped()
                    .listRowInsets(EdgeInsets())
            }
            
            Section(header: Text(" ")) {
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
        .background(Color("MainBackgroundColor"))
        .listStyle(GroupedListStyle())
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}


