//
//  ContentView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 3/20/25.
//

import FirebaseFirestore
import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        // TOP BAR
        ZStack() {
            Color.blue.edgesIgnoringSafeArea(.all).frame(height: 45).frame(maxWidth: .infinity)
            HStack {
                Button(action: {
                    print("Menu tapped")
                }) {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(8)
                }
                .buttonStyle(.borderless)
                Spacer()
                Text("Search")
                    .foregroundColor(.white).bold(true).font(.title2)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                
                Image("club_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:25, height:25)
                    .padding(10)
            }
        }

        // SEARCH BAR
        HStack {
            Button(action: {
                searchFirestore()
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }
            .buttonStyle(.borderless)
            
            TextField("Enter Desc, Part#, ID#", text: $searchText)
                .padding(10)
                .frame(width: UIScreen.main.bounds.width * 0.75, height: 40)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding(.top, 10) // Spacing from the ZStack
        Spacer()
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            print("Search tapped")
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 18))
                        }
                    Text("Search").font(.caption).foregroundColor(.primary)
                    }
                    Spacer()
                    Spacer()
                    VStack {
                        Button(action: {
                            print("Scan tapped")
                        }) {
                            Image(systemName: "qrcode.viewfinder")
                                .font(.system(size: 18))
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
                                .font(.system(size: 18))
                                .foregroundColor(.gray);
                        }
                        Text("Find").font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                }
            }
        }
    }
    
    private func searchFirestore() {
        let db = Firestore.firestore()
        db.collection("rocket_parts")
            .whereField("name", isEqualTo: searchText)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                } else {
                    for document in snapshot!.documents {
                        print("Found part: \(document.data())")
                    }
                }
            }
    }
}
#Preview {
    ContentView()
}
