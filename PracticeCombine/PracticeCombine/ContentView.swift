//
//  ContentView.swift
//  PracticeCombine
//
//  Created by yongbeomkwak on 2022/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button {
                print("Action")
            } label: {
                Text("Hello")
            }
            
            HStack{
                Text("PP")
                Text("PP")
                Text("PP")
                Text("PP")
                Text("PP")
                Text("PP")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
