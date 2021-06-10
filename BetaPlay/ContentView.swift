//
//  ContentView.swift
//  BetaPlay
//
//  Created by Johnny Hacking on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var people = [
    Profile(name: "Johnny", avatar: "person"),
    Profile(name: "Shaylee", avatar: "person.crop.circle"),
    Profile(name: "Macady", avatar: "person.badge.plus")]
    
    var body: some View {
        VStack{
            Text("My People")
                .font(.largeTitle)
                .fontWeight(.heavy)
            HStack{
                ForEach(people){ person in
                    Image(systemName: person.avatar)
                    Text(person.name)
                }
                .font(.title2)
            }
            List{
                ForEach($people){ $person in
                    if #available(iOS 15.0, *) {
                        Label{
                            TextField("Name", text: $person.name)
                        } icon: {
                            Image(systemName: person.avatar)
                        }
                        .listRowSeparator(.hidden)
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}

struct Profile: Identifiable{
    var id = UUID()
    var name: String
    var avatar: String
}

