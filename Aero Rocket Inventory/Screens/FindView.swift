//
//  FindView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 3/27/25.
//

import SwiftUI

struct FindView: View {
    
    @State private var presentContent: Bool = true
    
    var body: some View {
        NavigationView {
            if presentContent {
                content
            } else {
                ListView()
            }
        }
    }
    
    var content: some View {
        ZStack {
            ScrollView {
                Spacer()
                ZStack() {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.88, height: 650)
                        .colorInvert()
                        .border(Color.primary)
                    VStack() {                            Text("Maker Space")
                            .padding(10)
                        Spacer()
                    }
                    Rectangle().fill(.red)
                        .frame(width: 40, height: 100)
                        .offset(y:250)
                        .offset(x:155)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    FindView()
}
