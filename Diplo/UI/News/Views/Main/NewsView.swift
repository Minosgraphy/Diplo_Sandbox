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
    
    private var categories: [String] = ["general", "business", "health", "technology", "entertainment", "science"]
    
    var body: some View {
        VStack {
            newsViewList
                .onAppear(perform: {
                    self.viewModel.getTopHeadlines()
                })
            Spacer()
        }
        .background(MainBackground())
        .navigationBarTitle(Text("News"), displayMode: .large)
        .navigationBarItems(trailing:
            HStack(spacing: 25) {
                Button(action: {
                    self.showSearchSheet.toggle()
                }) {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .font(.headline)
                }
                .frame(width: 25, height: 25, alignment: .center)
                .sheet(isPresented: self.$showSearchSheet) {
                    SearchForArticlesView()
                }
            }
            .padding(.horizontal)
        )
    }
    
    private var newsViewList: some View {
        VStack {
            if viewModel.topHeadlines.isEmpty {
                ActivityIndicator()
                    .frame(width: UIScreen.main.bounds.width - 72,
                           height: UIScreen.main.bounds.width / 4 * 2,
                           alignment: .center)
            }
            else {
                VStack {
                    TopHeadlinesView(topHeadlines: viewModel.topHeadlines)
                        .frame(width: UIScreen.main.bounds.width - 72,
                               height: UIScreen.main.bounds.width / 4 * 2,
                               alignment: .center)
                        .clipped()
                        .cornerRadius(20)
                        .padding()
                        .shadow(color: Color("MainBackgroundShadowTLeading"), radius: 13, x: -6, y: -6)
                        .shadow(color: Color("MainBackgroundShadowBTrailing"), radius: 13, x: 6, y: 6)
                }
            }
            
            Form {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: ArticlesFromCategoryView(category: category)
                            .navigationBarTitle(Text(category.localized().capitalizeFirstLetter()), displayMode: .automatic)
                    ) {
                        Text(category.localized().capitalizeFirstLetter())
                            .font(.custom("Avenir Next", size: 15))
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                            .frame(height: 50)
                    }
                }
                .listRowBackground(Color("MainBackgroundColor"))
                .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
            
            Spacer()
        }
    }
}
