//
//  TabView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 3/28/25.
//

import SwiftUI

struct ARITabView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        if #available(iOS 13.0, *) {
            appearance.backgroundColor = UIColor { traitCollection in
                return traitCollection.userInterfaceStyle == .dark ? UIColor(white: 0.1, alpha: 1.0) : UIColor(white: 0.9, alpha: 1.0)
            }
        }
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
    }
    
    @State var lastView: String = "Search"
    @State var tabIndex: Int = 0
    @State var presentSheet: Bool = false
    @State var showMenu: Bool = false
    
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Color.blue.edgesIgnoringSafeArea(.all).frame(height: 45).frame(maxWidth: .infinity)
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                                .padding(.leading, 18)
                        }
                        .buttonStyle(.borderless)
                        Spacer()
                        Text(lastView)
                            .font(.system(size: 20))
                            .foregroundColor(.white).bold(true).font(.title2)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        
                        Image("club_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width:25, height:25)
                            .padding(.trailing, 18)
                    }
                }
                Spacer()
                TabView(selection: $tabIndex) {
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .tag(0)
                        .onAppear {lastView = "Search"}
                    
                    ScanView(presentSheet: $presentSheet, lastView: $lastView, tabIndex: $tabIndex)
                        .tabItem {
                            Image(systemName: "qrcode.viewfinder")
                            Text("Scan")
                        }
                        .tag(1)
                        .onAppear {presentSheet = true}
                    
                    FindView()
                        .tabItem {
                            Image(systemName: "shippingbox")
                            Text("Find")
                        }
                        .tag(2)
                        .onAppear {lastView = "Find"}
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
            .offset(x: showMenu ? 264 : 0)
            .animation(.easeInOut(duration: 0.3), value: showMenu)
            
            
            MenuView(isShowing: $showMenu)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
                .offset(x: showMenu ? 0 : -264)
                .opacity(showMenu ? 1 : 0)
                .animation(.easeInOut(duration: 0.3), value: showMenu)
                .transition(.move(edge: .leading))
            
        }
    }
}


#Preview {
    ARITabView()
}
