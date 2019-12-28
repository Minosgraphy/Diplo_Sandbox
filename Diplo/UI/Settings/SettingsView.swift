//
//  SettingsView.swift
//  Diplo
//
//  Created by Björn Waltert on 27.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: Text("")) {
                        HStack(spacing: 15) {
                            Image("Avatar")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                            
                            VStack(alignment: .leading) {
                                Text("Maximilian Mino")
                                    .font(.custom("Avenir Next", size: 21)).fontWeight(.semibold)
                                
                                Text("minosgraphy@gmail.com")
                                    .font(.custom("Avenir Next", size: 15)).fontWeight(.regular)
                            }
                        }
                    }
                }.frame(height: 70)
                
                Section {
                    NavigationLink(destination: NewsSettings()) {
                        HStack {
                            Image(systemName: "book")
                            Text("News")
                                .font(.custom("Avenir Next", size: 21)).fontWeight(.regular)
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: OrdersSettings()) {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("Orders")
                                .font(.custom("Avenir Next", size: 21)).fontWeight(.regular)
                        }
                    }
                    
                    NavigationLink(destination: Text("")) {
                        HStack {
                            Image(systemName: "doc")
                            Text("Documents")
                                .font(.custom("Avenir Next", size: 21)).fontWeight(.regular)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
