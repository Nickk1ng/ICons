//
//  Browse.swift
//  ICons
//
//  Created by Justin King on 2022-03-16.
//

import SwiftUI

struct Browse: View {
    var body: some View {
        //NavigationView{
            ScrollView(.vertical){
                ZStack{
                    Color(red: 0.0, green: 0.15, blue: 0.35).ignoresSafeArea()
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
                        NavigationLink(destination: checkout(), label: {CheckView()}).navigationBarTitle("Equipment Rental")
                            .navigationBarTitleDisplayMode(.large)
                    }
                    .scaledToFit()
                }
            }

//        }
//        .onAppear {
//            let appearance = UINavigationBarAppearance()
//            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
//            appearance.backgroundColor = UIColor(Color(red: 0.0, green: 0.1, blue: 0.25).opacity(1))
//            UINavigationBar.appearance().standardAppearance = appearance
//            UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        }
        
    }
}

struct Browse_Previews: PreviewProvider {
    static var previews: some View {
        Browse()
    }
}
