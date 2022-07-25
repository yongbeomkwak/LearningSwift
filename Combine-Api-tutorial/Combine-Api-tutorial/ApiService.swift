//
//  ApiService.swift
//  Combine-Api-tutorial
//
//  Created by yongbeomkwak on 2022/07/25.
//

import Foundation
import Combine
import Alamofire

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
        
//        return URLSession.shared.dataTaskPublisher(for: API.fetchTodos.url)
//            .map{$0.data}
//            .decode(type: [Todo].self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
        
        
        //AF로 Refactor
        return AF.request(API.fetchTodos.url)
            .publishDecodable(type: [Todo].self) //디코딩
            .value() // 값만 가져오기
            .mapError { (afError:AFError) in
                //.value를 거치면 AnyPublisher<Value, AFError> 상태이므로 AFError -> Error로 캐스팅
                return afError as Error
            }
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
