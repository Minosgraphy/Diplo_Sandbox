//
//  SearchForArticlesView.swift
//  Diplo
//
//  Created by Björn Waltert on 01.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct SearchForArticlesView : View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModelSearch = SearchForArticlesViewModel()
    
    @State private var searchFilter: String = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "MainBackgroundColor")
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.secondaryLabel,
            .font : UIFont(name:"Avenir Next", size: 40)!
        ]
    }
    
    var body: some View {
        NavigationView(content: {
            VStack {
                searchBar
                    .padding([.leading, .trailing], 8)
                    .frame(height: 32)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding([.leading, .trailing], 16)
                    .background(Color("MainBackgroundColor"))
                
                ArticlesList(articles: viewModelSearch.articles)
            }
            .background(Color("MainBackgroundColor"))
            .navigationBarTitle(
                Text("Search"), displayMode: .large)
            .navigationBarItems(trailing: Button("Done".localized().capitalizeFirstLetter()) { self.presentationMode.wrappedValue.dismiss() })
        })
    }
    
    private var searchBar: some View {
        TextField("Search articles...".localized(),
                  text: $searchFilter,
                  onEditingChanged: { (isOpened) in
                    if !isOpened {
                        self.viewModelSearch.searchForArticles(searchFilter: self.searchFilter)
                    }
        })
    }
}

