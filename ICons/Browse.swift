//
//  Browse.swift
//  ICons
//
//  Created by Justin King on 2022-03-16.
//

import SwiftUI

struct Browse: View {
    var ScrollToItem = ""
    var body: some View {
         let Title = "Equipment Rental"
        ZStack{
            Color(red: 0.0, green: 0.15, blue: 0.35).ignoresSafeArea()
            ScrollView(.vertical){
//                ScrollViewReader { value in
//                    Button("Jump to #8") {
//                        value.scrollTo(8, anchor: .top)
//                    }
//                    
//                }
                    VStack{
                        HStack{
                            VStack(alignment: .center, spacing:30){
                                ProductView(ImageName: "Casio 991 Calculator", ProductName: "Casio 991 Calculator").id(1)
                                ProductView(ImageName: "Screen Shot", ProductName: "USB-C Laptop Charger").id(2)
                                ProductView(ImageName: "Screen Shot", ProductName: "30cm Ruler").id(3)
                                ProductView(ImageName: "Screen Shot", ProductName: "Casio 991 Calculator 2").id(4)
                                
                            }
                            .padding(.horizontal, 10)
                            VStack(alignment: .center, spacing:30){
                                ProductView(ImageName: "Screen Shot", ProductName: "Casio 991 Calculator 3").id(5)
                                ProductView(ImageName: "Screen Shot", ProductName: "Casio 991 Calculator 4").id(6)
                                ProductView(ImageName: "Screen Shot", ProductName: "Casio 991 Calculator 5").id(7)
                                ProductView(ImageName: "Screen Shot", ProductName: "Casio 991 Calculator 6").id(8)

                            }
                            .padding(.horizontal, 10.0)
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
