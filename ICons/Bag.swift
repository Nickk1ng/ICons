//
//  Bag.swift
//  ICons
//
//  Created by Justin King on 2022-03-20.
//

import SwiftUI

struct Bag: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            Image(systemName: "bag").foregroundColor(.white).font(.system(size:100.0))
            
        }
        
    }
}

struct Bag_Previews: PreviewProvider {
    static var previews: some View {
        Bag()
    }
}
