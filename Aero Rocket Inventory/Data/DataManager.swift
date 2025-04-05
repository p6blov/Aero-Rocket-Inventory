//
//  DataManager.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 4/2/25.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var items: [Item] = []
    
    func getItems() {
        items.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("items")
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                }
            }
        }
    }
}
