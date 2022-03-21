//
//  Home.swift
//  ICons
//
//  Created by Justin King on 2022-03-20.
//

import SwiftUI

struct Home: View {
    var body: some View {
        let Title = "Home"
        ZStack{
            Color.yellow.ignoresSafeArea()
            VStack{
            Image(systemName: "house").foregroundColor(.white).font(.system(size:100.0))
            NavigationLink (destination: SecondScreen(), label:{ RentalView()}).navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle(Title)
            NavigationLink (destination: Bag(), label:{ BagView()}).navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle(Title)
            }.navigationBarBackButtonHidden(true)
        }
    }
}
struct BagView: View {
    var body: some View{
          Text("Bag").font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.white).padding(.all).frame(width: 150, height:50).background(.red).cornerRadius(25).shadow(radius: 10)
    }
}
struct RentalView: View {
    var body: some View{
        Text("Rental").font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(.white).padding(.all).frame(width: 150, height:50).background(.yellow).cornerRadius(25).shadow(radius: 10)
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
