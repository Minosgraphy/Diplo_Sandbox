//
//  HomeView.swift
//  Diplo
//
//  Created by Björn Waltert on 02.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(named: "MainBackgroundColor")
    }
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: - OTHERS
                Section {
                    Group {
                        // MARK: Apps
                        NavigationLink(destination: AppsView()) {
                            DRow(iconColor: Color(#colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)),
                                 iconImg: "flame",
                                 title: "apps")
                        }
                        
                        // MARK: Tools
                        NavigationLink(destination: Text("")) {
                            DRow(iconColor: Color(#colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)),
                                 iconImg: "wrench.fill",
                                 title: "tools")
                        }
                        
                        // MARK: News
                        NavigationLink(destination: NewsView()) {
                            DRow(iconColor: Color(#colorLiteral(red: 0.1568627451, green: 0.8039215686, blue: 0.2549019608, alpha: 1)),
                                 iconImg: "book.fill",
                                 title: "news")
                        }
                        
                        // MARK: Orders
                        NavigationLink(destination: OrdersView()) {
                            DRow(iconColor: Color(#colorLiteral(red: 0.6862745098, green: 0.3215686275, blue: 0.8705882353, alpha: 1)),
                                 iconImg: "list.bullet",
                                 title: "orders")
                        }
                    }
                    .listRowBackground(Color("MainBackgroundColorListRow"))
                }
                
                // MARK: - SETTINGS
                Section {
                    Group {
                        // MARK: Settings
                        NavigationLink(destination: SettingsView()) {
                            DRow(iconColor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
                                 iconImg: "gear",
                                 title: "settings")
                        }
                    }
                    .listRowBackground(Color("MainBackgroundColorListRow"))
                }
            }
            .navigationBarTitle(
                "welcome"
                    .localized()
                    .capitalizeFirstLetter()
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
