//
//  SettingsView.swift
//  Diplo
//
//  Created by Björn Waltert on 04.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            // MARK: - INFO
            Section {
                Group {
                    NavigationLink(destination: Text("")) {
                        Text("info".capitalizeFirstLetter())
                    }
                    .disabled(true)
                }
            }
            .listRowBackground(Color("MainBackgroundColorListRow"))
            
            // MARK: - OTHERS
            Section {
                Group {
                    NavigationLink(destination: Text("")) {
                        Text("general".localized().capitalizeFirstLetter())
                    }.disabled(true)
                    
                    NavigationLink(destination: Text("")) {
                        Text("apps".localized().capitalizeFirstLetter())
                    }.disabled(true)
                    
                    NavigationLink(destination: Text("")) {
                        Text("tools".localized().capitalizeFirstLetter())
                    }.disabled(true)
                    
                    NavigationLink(destination: Text("")) {
                        Text("news".localized().capitalizeFirstLetter())
                    }.disabled(true)
                }
            }
            .listRowBackground(Color("MainBackgroundColorListRow"))
            
        }
        .navigationBarTitle(Text("settings".localized().capitalizeFirstLetter()), displayMode: .large)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
