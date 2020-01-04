//
//  HomeView.swift
//  Diplo
//
//  Created by Björn Waltert on 02.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Form {
                // MARK: - USER
                Section {
                    NavigationLink(destination: Text("")) {
                        Text("user".localized().capitalizeFirstLetter())
                    }
                }
                .listRowBackground(Color("MainBackgroundColorListRow"))
                
                // MARK: - OTHERS
                Section {
                    // MARK: Apps
                    Group {
                        NavigationLink(destination:
                            AppsView()
                        ) {
                            ZStack {
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)))
                                
                                Image(systemName: "flame")
                                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            }
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(7)
                            
                            Text("apps".localized().capitalizeFirstLetter())
                        }
                    }
                    
                    // MARK: Tools
                    Group {
                        NavigationLink(destination: OrdersView()) {
                            ZStack {
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)))
                                
                                Image(systemName: "wrench.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            }
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(7)
                            
                            Text("tools".localized().capitalizeFirstLetter())
                        }
                    }
                    
                    // MARK: News
                    Group {
                        NavigationLink(destination: NewsView()) {
                            ZStack {
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 0.1568627451, green: 0.8039215686, blue: 0.2549019608, alpha: 1)))
                                
                                Image(systemName: "book.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            }
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(7)
                            
                            Text("news".localized().capitalizeFirstLetter())
                        }
                    }
                    
                    // MARK: Orders
                    Group {
                        NavigationLink(destination: OrdersView()) {
                            ZStack {
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 0.6862745098, green: 0.3215686275, blue: 0.8705882353, alpha: 1)))
                                
                                Image(systemName: "list.bullet")
                                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            }
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(7)
                            
                            Text("orders".localized().capitalizeFirstLetter())
                        }
                    }
                }
                .listRowBackground(Color("MainBackgroundColorListRow"))
                
                // MARK: - SETTINGS
                Section {
                    Group {
                        NavigationLink(destination: SettingsView()) {
                            ZStack {
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                
                                Image(systemName: "gear")
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            }
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(7)
                            
                            Text("settings".localized().capitalizeFirstLetter())
                        }
                    }
                }
                .listRowBackground(Color("MainBackgroundColorListRow"))
            }
            .navigationBarTitle(Text(" ".localized().capitalizeFirstLetter()), displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
