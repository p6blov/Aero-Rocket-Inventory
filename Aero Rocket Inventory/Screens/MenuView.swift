//
//  MenuSearchView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 4/2/25.
//



//.background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16.0))
//.ignoresSafeArea()


import SwiftUI

struct MenuView: View {
    @Binding var isShowing: Bool
    @State private var offsetX: CGFloat = -264
    
    var body: some View {
        content
            .onAppear {
                withAnimation(.easeInOut(duration: 0.3)) {
                    offsetX = 0
                }
            }
            .onDisappear {
                withAnimation(.easeInOut(duration: 0.3)) {
                    offsetX = -264
                }
            }
    }
    
    var content: some View {
        ZStack {
            if isShowing {
                Rectangle().fill(.gray)
                    .opacity(0.1)
                    .ignoresSafeArea(edges: .all)
                    .onTapGesture {
                        isShowing = false
                    }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 32) {
                    Text("MENU\nMENU\nMENU\n--------------------")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 65)
                .frame(width: 264)
                .background(.black)
                .offset(x: offsetX)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MenuView(isShowing: .constant(true))
}
