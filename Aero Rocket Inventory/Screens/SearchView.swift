//
//  ContentView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 3/20/25.
//

import FirebaseFirestore
import SwiftUI

struct SearchView: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.9)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    @State private var searchText = ""
    @State private var userLoggedIn = false
    var body: some View {
        NavigationStack {
            VStack {
                // SEARCH BAR
                HStack {
                    Button(action: {
                        print("Search pressed")
                        print(searchText )
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                    }
                    .buttonStyle(.borderless)
                    
                    TextField("Enter Desc, Part#, ID#", text: $searchText)
                        .padding(10)
                        .frame(width: UIScreen.main.bounds.width * 0.53, height: 40)
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                .padding(.top, 10)
                Divider()
                    .background(Color.gray)
                    .padding(.vertical, 10)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
#Preview {
    SearchView()
}
