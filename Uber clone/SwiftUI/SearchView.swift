//
//  SearchView.swift
//  Uber clone
//
//  Created by praneeth vithanage on 7/20/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit

struct SearchView: View {
    
    @State var result : [SearchData] = []
    @Binding var show : Bool
    var body: some View {
        GeometryReader{_ in
            VStack(spacing : 0){
                Searchbar()
                 Divider()
                
                if !self.result.isEmpty{
                    List(self.result){i in
                        VStack(alignment: .leading){
                            Text(i.name)
                            Text(i.address).font(.caption)
                        }
                        
                    }
                    .frame(height:UIScreen.main.bounds.height / 2)
                }
            }
            .padding(.horizontal,25)
        }
        .background(Color.black.opacity(0.2).edgesIgnoringSafeArea(.all))
        .onTapGesture{
            self.show.toggle()
        }
    }
}

struct Searchbar : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Searchbar.Coordinator(parent1: self )
    }
    
    func makeUIView(context:Context) -> UISearchBar {
        
        let view = UISearchBar()
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.delegate = context.coordinator
        
        return view
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context:Context) {
    
    }
    
    class Coordinator : NSObject,UISearchBarDelegate{
        var parent : Searchbar
        init(parent1 : Searchbar){
            parent = parent1
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print(searchText)
        }
    }
}

struct SearchData : Identifiable {
    var id : Int
    var name : String
    var address : String
    var coordinate : CLLocationCoordinate2D
    
}
