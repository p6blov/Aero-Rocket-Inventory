//
//  ContentView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack {
                    Text("SEDS Aerospace Rocket Inventory")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    VStack {
                        Button(action: {
                            print("Search tapped")
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20)) // Increase icon size
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
