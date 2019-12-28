//
//  TabBar.swift
//  Diplo
//
//  Created by Björn Waltert on 27.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house").imageScale(.large)
                    Text("")
                }
                .tag(1)
            
            NewsView()
                .tabItem {
                    Image(systemName: "book").imageScale(.large)
                    Text("")
                }
                .tag(2)
            
            OrdersView()
                .tabItem {
                    Image(systemName: "list.bullet").imageScale(.large)
                    Text("")
                }
                .tag(3)
            
            DocumentsView()
                .tabItem {
                    Image(systemName: "doc.text").imageScale(.large)
                    Text("")
                }
                .tag(4)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear").imageScale(.large)
                    Text("")
                }
                .tag(5)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
