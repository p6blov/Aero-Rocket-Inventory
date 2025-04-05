//
//  ScanView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 3/28/25.
//

import SwiftUI

struct ScanView: View {
    @Binding var presentSheet: Bool
    @Binding var lastView: String
    @Binding var tabIndex: Int
    
    var body: some View {
        //        NavigationStack {
        //            switch lastView {
        //            case "Search":
        //                SearchView()
        //            case "Find":
        //                FindView()
        //            default:
        //                SearchView()
        //            }
        
        Text("")
            .sheet(isPresented: $presentSheet, onDismiss: {
                navigateBack()
            }) {
                content
                //            }
            }
    }
    
    var content: some View {
        ZStack {
            CameraView()
                .frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
            VStack() {
                HStack {
                    Button(action: {
                        navigateBack()
                    }) {
                        HStack() {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                        }
                        .padding(22)
                    }
                    .buttonStyle(.borderless)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    private func navigateBack() {
        presentSheet = false
        switch lastView {
        case "Find":
            tabIndex = 2
        default:
            tabIndex = 0
        }
    }
}

#Preview {
    @Previewable @State var lastView = "SearchView"
    @Previewable @State var tabIndex = 0
    @Previewable @State var presentSheet: Bool = false
    
    return ScanView(presentSheet: $presentSheet, lastView: $lastView, tabIndex: $tabIndex)
}
