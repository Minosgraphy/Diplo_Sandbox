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
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        NavigationView(content: {
            ZStack {
                MainBackgroundColor()
                
                newsViewList
                    .animation(.spring())
                    .onAppear(perform: {
                        self.viewModel.getTopHeadlines()
                    })
            }
            .navigationBarTitle("News", displayMode: .large)
        })
    }
    
    private var newsViewList: some View {
        VStack {
            if viewModel.topHeadlines.isEmpty {
                ActivityIndicator()
                    .frame(width: UIScreen.main.bounds.width - 100,
                           height: UIScreen.main.bounds.width / 4 * 2,
                           alignment: .center)
            }
            else {
                VStack {
                    TopHeadlinesView(topHeadlines: viewModel.topHeadlines)
                        .frame(width: UIScreen.main.bounds.width - 100,
                               height: UIScreen.main.bounds.width / 4 * 2,
                               alignment: .center)
                        .clipped()
                        .cornerRadius(20)
                        .padding()
                }
            }
            
            List {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: ArticlesFromCategoryView(category: category) .navigationBarTitle(Text(category.localized().capitalizeFirstLetter()), displayMode: .large)
                    ) {
                        Text(category.localized().capitalizeFirstLetter())
                    }
                }
                .listRowBackground(Color("MainBackgroundColor"))
            }
            .listStyle(GroupedListStyle())
            
            Spacer()
        }
    }
}
