//
//  checkout.swift
//  ICons
//
//  Created by Justin King on 2022-03-16.
//

import SwiftUI

struct checkout: View {
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            Image(systemName: "cart").foregroundColor(.white).font(.system(size:100.0))
        }
    }
}

struct checkout_Previews: PreviewProvider {
    static var previews: some View {
        checkout()
    }
}
