//
//  ContentView.swift
//  RandomUserApi
//
//  Created by yongbeomkwak on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomuserViewModel = RandomUserViewModel()
    
    var body: some View {
        
        
        VStack {
            Button {
                randomuserViewModel.randomusers = [RandomUser] ()
            } label: {
                Text("Hello")
            }
            List(randomuserViewModel.randomusers){ aRandomUser in
                RandomUserRowView(aRandomUser)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
