//
//  ContentView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 100)
                .ignoresSafeArea(edges: .top)
            Text("Aerospace Rocket Inventory")
                .foregroundColor(.white)
            Spacer()
        }
        // MAIN CONTENT
        ZStack {
            Color(.black).ignoresSafeArea()
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                print("Search tapped")
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 20))
                            }
                            Text("Search").font(.caption).foregroundColor(.white)
                        }
                        Spacer()
                        Spacer()
                        VStack {
                            Button(action: {
                                print("Scan tapped")
                            }) {
                                Image(systemName: "qrcode.viewfinder")
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray);
                            }
                            Text("Scan").font(.caption).foregroundColor(.gray)
                        }
                        Spacer()
                        Spacer()
                        VStack {
                            Button(action: {
                                print("Find tapped")
                            }) {
                                Image(systemName: "shippingbox")
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray);
                            }
                            Text("Find").font(.caption).foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
            }
        }
}
#Preview {
    ContentView()
}
