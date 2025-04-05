//
//  ListView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 4/2/25.
//

import SwiftUI

struct ListView: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.9)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            Text("helloooo")
            
            .navigationTitle("Find")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Menu tapped")
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.borderless)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("club_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:25, height:25)
                }
            }

        }
    }
}

#Preview {
    ListView()
}
