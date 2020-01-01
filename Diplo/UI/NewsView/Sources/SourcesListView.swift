//
//  SourcesListView.swift
//  Diplo
//
//  Created by Björn Waltert on 01.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct SourcesListView : View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = SourcesListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "MainBackgroundColor")
    }
    
    var body: some View {
        NavigationView(content: {
            VStack {
                if viewModel.sources.isEmpty {
                    ZStack {
                        MainBackgroundColor()
                        ActivityIndicator()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: 50,
                                   alignment: .center)
                    }
                } else {
                    List(viewModel.sources, id: \.self) { source in
                        NavigationLink(
                            destination: ArticlesFromSourceView(source: source)
                                .navigationBarTitle(Text(source.name)),
                            label: {
                                Text(source.name)
                        }
                        )
                    }
                    .animation(.spring())
                }
            }
            .onAppear {
                self.viewModel.getSources()
            }
            .navigationBarTitle(Text("Sources".localized()), displayMode: .large)
            .navigationBarItems(trailing: Button("Done".localized()) { self.presentationMode.wrappedValue.dismiss() })
        })
    }
}
