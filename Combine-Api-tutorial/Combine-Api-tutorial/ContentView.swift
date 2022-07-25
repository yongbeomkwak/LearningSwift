//
//  ContentView.swift
//  Combine-Api-tutorial
//
//  Created by yongbeomkwak on 2022/07/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var viewModel:ViewModel
    
    init(){
        self._viewModel = StateObject.init(wrappedValue: ViewModel())
        
        //StateObject는  _(언더바)를 붙혀서 초기화를 해줘야함, bind과 같음
        
    }
    
    var body: some View {
        
        VStack{
            Button {
                self.viewModel.fetchTodos()
            } label: {
                Text("Todos 호출").foregroundColor(.white)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.gray))
            
            
            Button {
                self.viewModel.fetchPosts()
            } label: {
                Text("Posts 호출").foregroundColor(.white)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.gray))
            
            
            Button {
                self.viewModel.fetchTodosAndPostsAtTheSameTime()
            } label: {
                Text("Todos Posts 동시호출").foregroundColor(.white)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.gray))
            
        }
    }
    
    
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
