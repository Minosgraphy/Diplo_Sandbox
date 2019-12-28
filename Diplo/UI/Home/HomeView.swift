//
//  HomeView.swift
//  Diplo
//
//  Created by Björn Waltert on 27.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack {
            Image(systemName: "house").imageScale(.large)
            Text("Home")
                .font(.custom("Avenir Next", size: 28)).fontWeight(.regular)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
