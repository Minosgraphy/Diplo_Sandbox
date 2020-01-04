//
//  SourcesListView.swift
//  Diplo
//
//  Created by Björn Waltert on 03.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct SourcesListView : View {
    @ObservedObject var viewModel = SourcesListViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView(content: {
            VStack {
                if viewModel.sources.isEmpty {
                    ActivityIndicator()
                        .frame(width: UIScreen.main.bounds.width,
                               height: 50,
                               alignment: .center)
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
            .navigationBarTitle(Text("Sources".localized().capitalizeFirstLetter()), displayMode: .large)
            .navigationBarItems(trailing:
                Button(viewModel.sources.isEmpty ? "cancel".localized().capitalizeFirstLetter() : "close".localized().capitalizeFirstLetter()
                ) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        })
    }
}

