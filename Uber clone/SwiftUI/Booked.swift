//
//  Booked.swift
//  Uber clone
//
//  Created by praneeth vithanage on 7/20/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation
import Firebase


struct Booked {
    @Binding var data : Data
    @Binding var doc : String
    @Binding var loading : Bool
    @Binding var book : Bool
    
    
    var body : some View{
        
        GeometryReader{_ in
        VStack(spacing:25){
            Image(uiImage: UIImage(data: self.data)!)
            
            Button(action: {
                self.loading.toggle()
                self.book.toggle()
                
                let db = Firestore.firestore()
                db.collection("Bookings").document(self.doc).delete {
                    (err) in
                    if err != nil{
                        print((err?.localizedDescription)!)
                        return
                    }
                    self.loading.toggle()
                }
            }){
                Text("Cancel")
                                  .foregroundColor(.white)
                                  .padding(.vertical,10)
                                  .frame(width:UIScreen.main.bounds.width / 2)
            }
            .background(Color.red)
            .clipShape(Capsule())
        }
        
    .padding()
    .background(Color.white)
    .cornerRadius(12)
        }
        .background(Color.black.opacity(0.25)).edgesIgnoringSafeArea(.all)
    }
}
