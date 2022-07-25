//
//  ApiService.swift
//  Combine-Api-tutorial
//
//  Created by yongbeomkwak on 2022/07/25.
//

import Foundation
import Combine

enum API{
    case fetchTodos
    case fetchPosts
    
    var url: URL{
        
        switch self {
        case .fetchPosts: return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        case .fetchTodos: return URL(string: "https://jsonplaceholder.typicode.com/todos")!
        }
    }
}

enum ApiService {
    
    
    ///  Todos 가져오기
    /// - Returns: AnyPublisher<[Todo], Error>
    static func fetchTodos() -> AnyPublisher<[Todo], Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchTodos.url)
            .map{$0.data}
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    ///  Posts  가져오기
    /// - Returns: AnyPublisher<[Post], Error>
    static func fetchPosts() -> AnyPublisher<[Post], Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchPosts.url)
            .map{$0.data}
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    ///  Todos + Posts  동시호출
    /// - Returns: AnyPublisher (Tuple ([Todo],[Post]))
    static func fetchTodosAndPostsAtTheSameTime() -> AnyPublisher<([Todo],[Post]), Error> {
        
        let fetchedTodos = fetchTodos()
        let fetchedPosts = fetchPosts()
        
        return Publishers.CombineLatest(fetchedTodos,fetchedPosts).eraseToAnyPublisher()
    }
}
