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
    @ObservedObject var viewModelSearch = SearchForArticlesViewModel()
    
    @State private var searchFilter: String = ""
    
    @State private var showSearchSheet: Bool = false
    @State private var showSourcesSheet: Bool = false
    
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
            .navigationBarItems(trailing:
                Button(action: {
                        self.showSearchSheet.toggle()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.secondary)
                            .font(.headline)
                    }
                    .frame(width: 40, height: 40)
            )
            .sheet(isPresented: self.$showSearchSheet) {
                    SearchForArticlesView()
            }
        })
    }
    
    private var newsViewList: some View {
        VStack {
            if viewModel.topHeadlines.isEmpty {
                ActivityIndicator()
                    .frame(width: UIScreen.main.bounds.width - 75,
                           height: UIScreen.main.bounds.width / 4 * 2,
                           alignment: .center)
            }
            else {
                VStack {
                    TopHeadlinesView(topHeadlines: viewModel.topHeadlines)
                        .frame(width: UIScreen.main.bounds.width - 75,
                               height: UIScreen.main.bounds.width / 4 * 2,
                               alignment: .center)
                        .clipped()
                        .cornerRadius(20)
                        .padding()
                        .shadow(color: Color("MainBackgroundShadowTLeading"), radius: 13, x: -6, y: -6)
                        .shadow(color: Color("MainBackgroundShadowBTrailing"), radius: 13, x: 6, y: 6)
                }
            }
            
            List {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: ArticlesFromCategoryView(category: category) .navigationBarTitle(Text(category.localized().capitalizeFirstLetter()), displayMode: .automatic)
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
