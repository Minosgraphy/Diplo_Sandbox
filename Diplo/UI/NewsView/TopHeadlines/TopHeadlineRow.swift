//
//  TopHeadlineRow.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import Combine
import KingfisherSwiftUI
import SwiftUI

struct TopHeadlineRow : View {
    @State var shouldPresentURL: Bool = false
    @State var selectedURL: URL?
    
    var article: Article
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: article.urlToImage ?? ""))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(4 / 3, contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 75,
                       height: UIScreen.main.bounds.width / 4 * 2,
                       alignment: .center)
            
            Rectangle()
                .fill((LinearGradient(gradient: Gradient(colors: [Color(.clear), Color("MainBackgroundShadowBTrailing")]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                .opacity(0.9)
                .frame(width: UIScreen.main.bounds.width - 75,
                       height: UIScreen.main.bounds.width / 4 * 2,
                       alignment: .center)
            
            Button(
                action: {
                    self.shouldPresentURL = true
            },
                label: {
                    topHeadlineInfo
            }
            )
        }
        .sheet(isPresented: $shouldPresentURL) {
            SafariView(url: self.article.url)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    private var topHeadlineInfo: some View {
        VStack {
            Text(verbatim: article.source?.name ?? "")
                .foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(nil)
                .padding([.leading, .trailing])
                .frame(width: UIScreen.main.bounds.width - 75,
                       alignment: .bottomLeading)
            
            Text(verbatim: article.title ?? "")
                .foregroundColor(.white)
                .font(.headline)
                .lineLimit(nil)
                .padding([.leading, .bottom, .trailing])
                .frame(width: UIScreen.main.bounds.width - 75,
                       alignment: .bottomLeading)
        }
    }
}
