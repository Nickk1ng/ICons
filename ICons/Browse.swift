//
//  Browse.swift
//  ICons
//
//  Created by Justin King on 2022-03-16.
//

import SwiftUI

struct Browse: View {
    var body: some View {
         let Title = "Equipment Rental"
        ZStack{
            Color(red: 0.0, green: 0.15, blue: 0.35).ignoresSafeArea()
            ScrollView(.vertical){
                    VStack{
                        HStack{
                            VStack(alignment: .center, spacing: 10){
                                ImageView(image: "Screen Shot")
                                ImageView(image: "Screen Shot")
                                ImageView(image: "Screen Shot")
                                ImageView(image: "Screen Shot")
                                
                            }
                            .padding()
                            VStack(alignment: .center, spacing: 10){
                                ImageView(image: "Screen Shot")
                                ImageView(image: "Screen Shot")
                                ImageView(image: "Screen Shot")
                                ImageView(image: "Screen Shot")
                               
                            }
                            .padding()
                            
                        }
                        NavigationLink(destination: checkout(), label: {CheckView()})
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarTitle(Title)
                    }
                    .scaledToFit()
                }
            }
    }
}

struct Browse_Previews: PreviewProvider {
    static var previews: some View {
        Browse()
    }
}
