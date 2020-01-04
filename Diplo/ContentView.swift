//
//  ContentView.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        ZStack {
            MainBackground()
        }
    }
}

// MARK: BACKGROUND
struct MainBackground: View {
    var body: some View {
        Rectangle()
            .fill(Color("MainBackgroundColor"))
            .edgesIgnoringSafeArea(.vertical)
    }
}

// MARK: PREVIEWS
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
