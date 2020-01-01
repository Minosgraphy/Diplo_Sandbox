//
//  TabedView.swift
//  Diplo
//
//  Created by Björn Waltert on 01.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

// MARK: TABEDVIEW
struct TabedView: View {
    
    @ObservedObject var viewRouter = ViewRouter()
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                // MARK: VIEWS
                Group {
                    if viewRouter.currentView == "home" {
                        ZStack {
                            Header()
                            VStack {
                                Spacer()
                                HomeView()
                                Spacer()
                            }
                        }
                    }
                    else if viewRouter.currentView == "news" {
                        VStack {
                            Spacer()
                            NewsView()
                            Spacer()
                        }
                    }
                    else if viewRouter.currentView == "orders" {
                        VStack {
                            Spacer()
                            ScrollView {
                                OrdersView()
                            }
                            Spacer()
                        }
                    }
                    else if viewRouter.currentView == "settings" {
                        VStack {
                            Spacer()
                            ScrollView {
                                SettingsView()
                            }
                            Spacer()
                        }
                    }
                }
                
                // MARK: BASE BACKGROUND CARD
                Group {
                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(Color("MainBackgroundColor"))
                            .frame(width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height / 7.5)
                            .cornerRadius(15)
                    }
                }
                
                // MARK: BUTTONS
                Group {
                    VStack {
                        Spacer()
                        HStack(spacing: 35) {
                            // MARK: HOME
                            Group {
                                Button(action: {
                                    self.viewRouter.currentView = "home"
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color("MainBackgroundColor"))
                                            .frame(width: 65, height: 65)
                                            .cornerRadius(15)
                                            .shadow(color: Color("MainBackgroundShadowTLeading"), radius: 16, x: -6, y: -6)
                                            .shadow(color: Color("MainBackgroundShadowBTrailing"), radius: 10, x: 6, y: 6)
                                        
                                        Image(systemName: "house")
                                            .foregroundColor(viewRouter.currentView == "home" ? .green : .secondary)
                                            .imageScale(.large)
                                            .font(.headline)
                                    }
                                }
                            }
                            
                            // MARK: NEWS
                            Group {
                                Button(action: {
                                    self.viewRouter.currentView = "news"
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color("MainBackgroundColor"))
                                            .frame(width: 65, height: 65)
                                            .cornerRadius(15)
                                            .shadow(color: Color("MainBackgroundShadowTLeading"), radius: 16, x: -6, y: -6)
                                            .shadow(color: Color("MainBackgroundShadowBTrailing"), radius: 10, x: 6, y: 6)
                                        
                                        Image(systemName: "book")
                                            .foregroundColor(viewRouter.currentView == "news" ? .green : .secondary)
                                            .imageScale(.large)
                                            .font(.headline)
                                    }
                                }
                            }
                            
                            // MARK: ORDERS
                            Group {
                                Button(action: {
                                    self.viewRouter.currentView = "orders"
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color("MainBackgroundColor"))
                                            .frame(width: 65, height: 65)
                                            .cornerRadius(15)
                                            .shadow(color: Color("MainBackgroundShadowTLeading"), radius: 10, x: -6, y: -6)
                                            .shadow(color: Color("MainBackgroundShadowBTrailing"), radius: 10, x: 6, y: 6)
                                        
                                        Image(systemName: "list.bullet")
                                            .foregroundColor(viewRouter.currentView == "orders" ? .green : .secondary)
                                            .imageScale(.large)
                                            .font(.headline)
                                    }
                                }
                            }
                            
                            // MARK: SETTINGS
                            Group {
                                Button(action: {
                                    self.viewRouter.currentView = "settings"
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color("MainBackgroundColor"))
                                            .frame(width: 65, height: 65)
                                            .cornerRadius(15)
                                            .shadow(color: Color("MainBackgroundShadowTLeading"), radius: 10, x: -6, y: -6)
                                            .shadow(color: Color("MainBackgroundShadowBTrailing"), radius: 10, x: 6, y: 6)
                                        
                                        Image(systemName: "gear")
                                            .foregroundColor(viewRouter.currentView == "settings" ? .green : .secondary)
                                            .imageScale(.large)
                                            .font(.headline)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 45)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabedView_Previews: PreviewProvider {
    static var previews: some View {
        TabedView()
    }
}
