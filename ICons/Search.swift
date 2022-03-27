//
//  Search.swift
//  ICons
//
//  Created by Justin King on 2022-03-16.
//

import SwiftUI

struct Search: View {
    @State var searchText = ""
    @State var searching = false
    
    let Items = [
        "Casio 991 Calculator", "Pants", "Charger", "Laptop", "Ruler", "Cherries ", "Mango ", "Watermelon ", "Grapes ", "Lemon "]
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color(red: 0.0, green: 0.15, blue: 0.35))
    }
    var body: some View {
           VStack(alignment: .leading) {
               SearchBar(searchText: $searchText, searching: $searching).background(Color(red: 0.0, green: 0.15, blue: 0.35))
               List {
                   ForEach(Items.filter({ (fruit: String) -> Bool in
                       return fruit.hasPrefix(searchText) || searchText == ""
                   }), id: \.self) { fruit in
                       NavigationLink(destination: Browse(), label: {Text(fruit).font(.title3).fontWeight(.medium).foregroundColor(.white)})
                   }.listRowBackground(Color(red: 0.5, green: 0.0, blue: 0.0))
               }.listStyle(GroupedListStyle())
                       if searching {
                           Button(action: {searchText = ""
                                  withAnimation {
                                     searching = false
                                     UIApplication.shared.dismissKeyboard()
                                  }})
                                 {
                                      HStack(alignment: .top){
                                          Group{
                                              Image(systemName: "multiply.circle.fill")
                                              Text("Cancel")
                                          }
                                      }
                                  }
                       }
           }.background(Color(red: 0.0, green: 0.15, blue: 0.35))
    }
}
struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search Iteams", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                }onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }.accentColor(.black)
            .foregroundColor(.black)
            .padding(.leading, 13)
        }
            .frame(height:50)
            .cornerRadius(20)
            .padding()
    }
}

extension UIApplication {
     func dismissKeyboard() {
         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     }
}
struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
