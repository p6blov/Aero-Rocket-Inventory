//
//  ScannerView.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 4/2/25.
//


import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraVC {
        CameraVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: CameraVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        func didFind(barcode: String) {
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            print(error)
        }
    }
}
