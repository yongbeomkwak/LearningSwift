//
//  ViewModel.swift
//  Combine-Api-tutorial
//
//  Created by yongbeomkwak on 2022/07/25.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    
    
    func fetchTodos(){
        
        ApiService.fetchTodos()
            .sink { completion in
                
                switch completion {
                case .failure(let err):
                    print("\(err)")
                case .finished:
                    print("Finish")
                }
                
            } receiveValue: { (todos: [Todo]) in
                print("todos count \(todos.count)")
            }.store(in: &subscriptions)
        
    }
    
    func fetchPosts(){
        
        ApiService.fetchPosts()
            .sink { completion in
                
                switch completion {
                case .failure(let err):
                    print("\(err)")
                case .finished:
                    print("Finish")
                }
                
            } receiveValue: { (posts: [Post]) in
                print("posts count \(posts.count)")
            }.store(in: &subscriptions)
        
    }
    
    func fetchTodosAndPostsAtTheSameTime()
    {
        ApiService.fetchTodosAndPostsAtTheSameTime()
            .sink { completion in
                
                switch completion {
                case .failure(let err):
                    print("\(err)")
                case .finished:
                    print("Finish")
                }
                
            } receiveValue: { (todos: [Todo], posts : [Post]) in
                print("sameTime todos \(todos.count)  posts \(posts.count)")
            }.store(in: &subscriptions)
    }
    
    
}
